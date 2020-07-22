# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_22_163716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foodlogs", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "foods_id", null: false
    t.bigint "meals_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foods_id"], name: "index_foodlogs_on_foods_id"
    t.index ["meals_id"], name: "index_foodlogs_on_meals_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "carbs"
    t.integer "proteins"
    t.integer "fats"
    t.integer "calories"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.integer "photo"
    t.integer "height"
    t.integer "weight"
    t.integer "bodyfat"
    t.integer "calorie_limit"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

  add_foreign_key "foodlogs", "foods", column: "foods_id"
  add_foreign_key "foodlogs", "meals", column: "meals_id"
end
