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

ActiveRecord::Schema.define(version: 20211010123222) do

  create_table "carfares", force: :cascade do |t|
    t.date "worked_on"
    t.string "site_id"
    t.integer "site_id_no"
    t.string "work_place"
    t.string "transportation"
    t.string "public_transportation"
    t.string "departure_place"
    t.string "arrival_place"
    t.integer "amount"
    t.integer "accommodation_fee"
    t.integer "moving_distance"
    t.integer "high_speed_rate"
    t.integer "parking_fee"
    t.boolean "confirmed_flag"
    t.boolean "approval_flag"
    t.boolean "rejection_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
