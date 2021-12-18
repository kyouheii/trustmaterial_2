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
    t.integer "user_id"
    t.integer "carfare_id"
    t.date "worked_day"
    t.string "commuting_place"
    t.string "commuting_place_private_car"
    t.string "public_institution"
    t.string "public_transportation_departure"
    t.string "public_transportation_departure_private_car"
    t.string "public_transportation_arrival"
    t.string "arrival_private_car"
    t.integer "public_transportation_cash"
    t.integer "hotel_charge"
    t.integer "hotel_charge_private_car"
    t.integer "moving_distance"
    t.integer "moving_distance_private_car"
    t.integer "highway_rate"
    t.integer "highway_rate_private_car"
    t.string "parking_name"
    t.string "parking_name_private_car"
    t.integer "parking_fee"
    t.integer "parking_fee_private_car"
    t.boolean "check_flag"
    t.boolean "check_flag_private_car"
    t.string "image"
    t.string "image_private_car"
    t.integer "all_pe_tr_ex"
    t.integer "sanin_public_transportation_departure"
    t.integer "sanin_public_transportation_arrival_fee"
    t.date "date_of_use"
    t.date "date_of_use_private_car"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.boolean "admin", default: false
    t.string "phone_number"
    t.string "nearest_station"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "line"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
