class ImportViolationsJob < ApplicationJob
  queue_as :default

  def perform(file_path, limit = nil)
    require "csv"

    row_count = 0
    CSV.foreach(file_path, headers: true) do |row|
      break if limit && row_count >= limit

      begin
        ActiveRecord::Base.transaction do
          # Find or create Owner with exact matching attributes
          owner = Owner.find_or_create_by!(
            name: row["owner_name"],
            address: row["owner_address"],
            city: row["owner_city"],
            state: row["owner_state"],
            zip: row["owner_zip"]
          )

          # Find or create Restaurant with exact matching attributes
          restaurant = Restaurant.find_or_create_by!(
            name: row["name"],
            address: row["address"],
            city: row["city"],
            postal_code: row["postal_code"],
            phone_number: row["phone_number"],
            owner_id: owner.id
          )

          # Find or create InspectionType
          inspection_type = InspectionType.find_or_create_by!(
            name: row["inspection_type"]
          )

          # Find or create ViolationType
          violation_type = ViolationType.find_or_create_by!(
            code: row["violation_type"]
          ) do |vt|
            vt.name = row["violation_type"]
            vt.description = row["description"]
            vt.risk_category = row["risk_category"]
          end

          # Create RestaurantViolation
          restaurant_violation = RestaurantViolation.find_or_create_by!(
            restaurant: restaurant,
            inspection_type: inspection_type,
            violation_type: violation_type,
            inspection_score: row["inspection_score"],
            inspection_date: parse_date(row["inspection_date"]),
            violation_date: parse_date(row["violation_date"])
          )

          # Increment counter only if a new record was created
          row_count += 1 if restaurant_violation.previously_new_record?

          Rails.logger.info "Processed row #{row_count}#{limit ? " of #{limit}" : ""}" if (row_count % 100).zero?
        end
      rescue StandardError => e
        Rails.logger.error "Failed to process row: #{row.inspect}"
        Rails.logger.error "Error: #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
      end
    end

    Rails.logger.info "Import completed. Processed #{row_count} rows#{limit ? " (limited to #{limit})" : ""}"
  end

  private

  def parse_date(date_str)
    return nil if date_str.blank?

    # Handle the format YYYYMMDD
    if date_str.match?(/\A\d{8}\z/)
      Date.strptime(date_str, "%Y%m%d")
    else
      Date.parse(date_str)
    end
  rescue Date::Error => e
    Rails.logger.error "Failed to parse date '#{date_str}': #{e.message}"
    nil
  end
end
