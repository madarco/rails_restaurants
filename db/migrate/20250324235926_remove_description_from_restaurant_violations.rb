class RemoveDescriptionFromRestaurantViolations < ActiveRecord::Migration[8.0]
  def change
    remove_column :restaurant_violations, :description, :text
  end
end
