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

ActiveRecord::Schema[8.0].define(version: 2025_08_25_010018) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.decimal "price_foreign"
    t.decimal "price_local"
    t.integer "duration_hours"
    t.bigint "park_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "max_participants"
    t.index ["park_id"], name: "index_activities_on_park_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "visitor_name"
    t.string "email"
    t.string "phone"
    t.date "visit_date"
    t.integer "number_of_visitors"
    t.integer "status"
    t.bigint "activity_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_bookings_on_activity_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.decimal "entrance_fee_foreign"
    t.decimal "entrance_fee_local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "location"
    t.string "highlights"
    t.string "image_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "parks"
  add_foreign_key "bookings", "activities"
  add_foreign_key "bookings", "users"
end
