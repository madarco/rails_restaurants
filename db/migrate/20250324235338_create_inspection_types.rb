class CreateInspectionTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :inspection_types do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end

    add_index :inspection_types, :name, unique: true
  end
end
