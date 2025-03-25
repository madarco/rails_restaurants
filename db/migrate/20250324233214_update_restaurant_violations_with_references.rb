class UpdateRestaurantViolationsWithReferences < ActiveRecord::Migration[8.0]
  def change
    change_table :restaurant_violations do |t|
      t.references :restaurant, null: false, foreign_key: true

      # Remove columns that are now in restaurants and owners tables
      t.remove :name
      t.remove :address
      t.remove :city
      t.remove :postal_code
      t.remove :phone_number
      t.remove :owner_name
      t.remove :owner_address
      t.remove :owner_city
      t.remove :owner_state
      t.remove :owner_zip
    end
  end
end
