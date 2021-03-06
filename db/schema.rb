# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_11_082600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_locations", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "location_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_locations_on_event_id", unique: true
    t.index ["location_id"], name: "index_event_locations_on_location_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "event_detail"
    t.date "event_start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "publish", default: false, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "event_id"
    t.string "ticket_name"
    t.string "ticket_detail"
    t.string "ticket_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "twitter_auth_id"
    t.string "twitter_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "twitter_token"
    t.string "twitter_secret"
  end

  add_foreign_key "event_locations", "events"
end
