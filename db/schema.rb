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

ActiveRecord::Schema.define(version: 2021_06_03_195453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.bigint "brewery_id"
    t.string "name"
    t.float "abv"
    t.string "description"
    t.bigint "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["style_id"], name: "index_beers_on_style_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "style_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_beers", force: :cascade do |t|
    t.bigint "beer_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_trip_beers_on_beer_id"
    t.index ["trip_id"], name: "index_trip_beers_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "date"
    t.float "elevation"
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  add_foreign_key "beers", "styles"
  add_foreign_key "trip_beers", "beers"
  add_foreign_key "trip_beers", "trips"
end
