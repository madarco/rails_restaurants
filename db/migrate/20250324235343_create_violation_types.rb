class CreateViolationTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :violation_types do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :description
      t.string :risk_category, null: false

      t.timestamps
    end

    add_index :violation_types, :code, unique: true
  end
end
