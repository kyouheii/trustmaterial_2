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

ActiveRecord::Schema.define(version: 20220130121626) do

  create_table "admins", force: :cascade do |t|
    t.integer "line_messaging_id"
    t.string "line_messaging_secret", null: false
    t.string "line_messaging_token", null: false
    t.integer "line_login_id", null: false
    t.string "line_login_secret", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carfares", force: :cascade do |t|
    t.integer "user_id"
    t.integer "carfare_id"
    t.date "worked_day"
    t.string "commuting_place"
    t.string "commuting_place_private_car"
    t.string "public_institution"
    t.string "public_transportation_departure"
    t.string "public_transportation_departure_private_car"
    t.string "point_of_departure"
    t.string "point_of_departure_private_car"
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
    t.string "application"
    t.string "application_1"
    t.string "application_ok"
    t.string "application_ok_1"
    t.string "note"
    t.string "note_1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carfares", force: :cascade do |t|
    t.integer "user_id"
    t.integer "carfare_id"
    t.date "worked_day"
    t.string "commuting_place"
    t.string "commuting_place_private_car"
    t.string "public_institution"
    t.string "public_transportation_departure"
    t.string "public_transportation_departure_private_car"
    t.string "point_of_departure"
    t.string "point_of_departure_private_car"
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

  create_table "clients", force: :cascade do |t|
    t.integer "client_number"
    t.string "client_name"
    t.string "postal_code"
    t.string "address"
    t.string "manager"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "sales_staff"
    t.string "item"
    t.string "pay_terms"
    t.date "due_date"
    t.integer "card_labor_cost"
    t.integer "card_incentive"
    t.integer "card_labor_commuting_allowance"
    t.integer "cell_phone_sales_labor_cost"
    t.integer "cell_phone_sales_commuting_allowance"
    t.integer "cell_phone_sales_saninline"
    t.integer "subtotal_fee"
    t.integer "tax"
    t.integer "total_fee"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cell_phone_sales_labor_cost_saninline"
<<<<<<< HEAD
=======
    t.string "invoice_date"
    t.string "invoice_number"
>>>>>>> 44af3af7a73ac8d83e3df0fdadcccf3fa08b3bd2
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.string "store"
    t.date "worked_date"
    t.string "staff_name"
<<<<<<< HEAD
    t.time "work_start_time", default: "2000-01-01 09:00:00"
    t.time "work_end_time", default: "2000-01-01 18:00:00"
    t.time "break_time", default: "2000-01-01 01:00:00"
=======
    t.time "work_start_time"
    t.time "work_end_time"
    t.time "break_time"
>>>>>>> 44af3af7a73ac8d83e3df0fdadcccf3fa08b3bd2
    t.string "division"
    t.integer "unit_price"
    t.integer "gain_cards"
    t.integer "gain_apps"
    t.integer "incentive"
    t.integer "commuting_allowance"
    t.string "note"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_number"
    t.index ["client_id"], name: "index_quotations_on_client_id"
  end

  create_table "sanin_quotations", force: :cascade do |t|
    t.integer "item_number"
    t.string "store"
    t.date "worked_date"
    t.string "staff_name"
    t.time "work_start_time"
    t.time "work_end_time"
    t.time "break_time"
    t.string "division"
    t.integer "unit_price"
    t.integer "commuting_allowance"
    t.string "note"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_sanin_quotations_on_client_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "arrived_at"
    t.datetime "finished_at"
    t.integer "user_id"
    t.string "round_batsu"
    t.string "note"
    t.string "site_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "color_change_site", default: false
    t.boolean "color_round_batsu", default: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "tusin_quotations", force: :cascade do |t|
    t.integer "item_number"
    t.string "store"
    t.date "worked_date"
    t.string "staff_name"
    t.time "work_start_time"
    t.time "work_end_time"
    t.time "break_time"
    t.string "division"
    t.integer "unit_price"
    t.integer "commuting_allowance"
    t.string "note"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_tusin_quotations_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.boolean "admin", default: false
    t.string "phone_number"
    t.string "nearest_station"
    t.datetime "started_at"
    t.datetime "arrived_at"
    t.datetime "finished_at"
    t.string "site_name"
    t.date "worked_on"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "line"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
