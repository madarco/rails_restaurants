class CreateOwners < ActiveRecord::Migration[8.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state, limit: 2
      t.integer :zip

      t.timestamps
    end
  end
end
