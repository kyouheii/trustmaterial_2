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

ActiveRecord::Schema.define(version: 20211227132404) do

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
    t.integer "cell_phone_sales_labor_cost_saninline"
    t.integer "cell_phone_sales_saninline"
    t.integer "subtotal_fee"
    t.integer "tax"
    t.integer "total_fee"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.string "store"
    t.date "worked_date"
    t.string "staff_name"
    t.time "work_start_time", default: "2000-01-01 00:00:00"
    t.time "work_end_time", default: "2000-01-01 09:00:00"
    t.time "break_time", default: "2000-01-01 16:00:00"
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
    t.index ["client_id"], name: "index_quotations_on_client_id"
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
