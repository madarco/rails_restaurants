# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_25_003715) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "inspection_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_inspection_types_on_name", unique: true
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state", limit: 2
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_owners_on_name"
  end

  create_table "restaurant_violations", force: :cascade do |t|
    t.integer "inspection_score"
    t.date "inspection_date"
    t.date "violation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id", null: false
    t.bigint "inspection_type_id", null: false
    t.bigint "violation_type_id", null: false
    t.index ["inspection_type_id"], name: "index_restaurant_violations_on_inspection_type_id"
    t.index ["restaurant_id"], name: "index_restaurant_violations_on_restaurant_id"
    t.index ["violation_type_id"], name: "index_restaurant_violations_on_violation_type_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.integer "postal_code"
    t.string "phone_number"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_restaurants_on_name"
    t.index ["owner_id"], name: "index_restaurants_on_owner_id"
  end

  create_table "violation_types", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "description"
    t.string "risk_category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_violation_types_on_code", unique: true
  end

  add_foreign_key "restaurant_violations", "inspection_types"
  add_foreign_key "restaurant_violations", "restaurants"
  add_foreign_key "restaurant_violations", "violation_types"
  add_foreign_key "restaurants", "owners"
end
