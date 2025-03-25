class CreateRestaurants < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :postal_code
      t.string :phone_number
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
