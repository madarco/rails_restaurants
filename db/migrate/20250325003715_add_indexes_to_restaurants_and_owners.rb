class AddIndexesToRestaurantsAndOwners < ActiveRecord::Migration[8.0]
  def change
    add_index :restaurants, :name
    add_index :owners, :name
  end
end
