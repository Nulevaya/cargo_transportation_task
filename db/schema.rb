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

ActiveRecord::Schema.define(version: 2019_09_15_161425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargos", force: :cascade do |t|
    t.integer "length", null: false
    t.integer "width", null: false
    t.integer "height", null: false
    t.integer "total_volume", null: false
    t.integer "total_weight", null: false
    t.integer "price"
    t.bigint "departure_city_id", null: false
    t.bigint "delivery_city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_city_id"], name: "index_cargos_on_delivery_city_id"
    t.index ["departure_city_id"], name: "index_cargos_on_departure_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cities_on_name"
  end

  add_foreign_key "cargos", "cities", column: "delivery_city_id"
  add_foreign_key "cargos", "cities", column: "departure_city_id"
end
