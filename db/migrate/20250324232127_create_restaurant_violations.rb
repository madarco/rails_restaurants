class CreateRestaurantViolations < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurant_violations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :postal_code
      t.string :phone_number
      t.string :owner_name
      t.string :owner_address
      t.string :owner_city
      t.string :owner_state, limit: 2
      t.integer :owner_zip
      t.integer :inspection_score
      t.date :inspection_date
      t.string :inspection_type
      t.date :violation_date
      t.string :violation_type
      t.string :risk_category
      t.text :description

      t.timestamps
    end
  end
end
