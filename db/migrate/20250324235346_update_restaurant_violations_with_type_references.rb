class UpdateRestaurantViolationsWithTypeReferences < ActiveRecord::Migration[8.0]
  def change
    change_table :restaurant_violations do |t|
      t.references :inspection_type, null: false, foreign_key: true
      t.references :violation_type, null: false, foreign_key: true

      # Remove the old string columns since we now have references
      t.remove :inspection_type
      t.remove :violation_type
      t.remove :risk_category  # This is now in violation_types table
    end
  end
end
