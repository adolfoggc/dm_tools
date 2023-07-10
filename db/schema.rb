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

ActiveRecord::Schema[7.0].define(version: 2023_07_10_020857) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armor_proprieties", force: :cascade do |t|
    t.bigint "armor_id", null: false
    t.bigint "propriety_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["armor_id"], name: "index_armor_proprieties_on_armor_id"
    t.index ["propriety_id"], name: "index_armor_proprieties_on_propriety_id"
  end

  create_table "armors", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.string "ac"
    t.integer "weight"
    t.integer "price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_armors_on_name", unique: true
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "challange_rating"
    t.integer "ac"
    t.string "hp"
    t.integer "size"
    t.string "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abilities"
    t.index ["name"], name: "index_monsters_on_name", unique: true
  end

  create_table "proprieties", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settlements", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "population"
    t.integer "kind"
  end

  create_table "taverns", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.string "description"
    t.string "roles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weapon_proprieties", force: :cascade do |t|
    t.bigint "weapon_id", null: false
    t.bigint "propriety_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["propriety_id"], name: "index_weapon_proprieties_on_propriety_id"
    t.index ["weapon_id"], name: "index_weapon_proprieties_on_weapon_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.string "dmg"
    t.integer "price"
    t.string "weight"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_weapons_on_name", unique: true
  end

  add_foreign_key "armor_proprieties", "armors"
  add_foreign_key "armor_proprieties", "proprieties"
  add_foreign_key "weapon_proprieties", "proprieties"
  add_foreign_key "weapon_proprieties", "weapons"
end
