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

ActiveRecord::Schema.define(version: 2022_07_24_031504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flight_inbound_details", force: :cascade do |t|
    t.date "flight_departure_date_from_saudi"
    t.string "flight_time_from_saudi"
    t.date "landing_date_in_kl"
    t.string "landing_time_in_kl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flight_outbound_details", force: :cascade do |t|
    t.date "flight_departure_date_from_kl"
    t.string "flight_time_from_kl"
    t.date "landing_date_in_saudi"
    t.string "landing_time_in_saudi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "umrah_customers", force: :cascade do |t|
    t.string "customer_name"
    t.string "house_tel"
    t.string "home_address"
    t.integer "total_participants"
    t.date "date_registered"
    t.string "total_paid"
    t.string "total_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "flight_inbound_detail_id"
    t.bigint "flight_outbound_detail_id"
    t.string "quotation_form"
    t.string "registration_form"
    t.string "deposit_payment"
    t.string "final_payment"
    t.string "customer_mahram"
    t.string "mobile_tel"
    t.string "customer_waris_name"
    t.string "waris_address"
    t.string "waris_tel"
    t.string "identification_card"
    t.string "gender"
    t.string "citizenship"
    t.integer "is_full_payment_made", default: 0
    t.integer "umrah_status", default: 0
    t.bigint "umrah_package_id"
    t.index ["flight_inbound_detail_id"], name: "index_umrah_customers_on_flight_inbound_detail_id"
    t.index ["flight_outbound_detail_id"], name: "index_umrah_customers_on_flight_outbound_detail_id"
    t.index ["umrah_package_id"], name: "index_umrah_customers_on_umrah_package_id"
  end

  create_table "umrah_packages", force: :cascade do |t|
    t.string "title"
    t.string "package_type"
    t.string "price"
    t.string "hotel_mekah"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "image_id"
    t.integer "rooms_per_pax"
    t.string "package_full_name"
    t.string "hotel_madinah"
    t.index ["image_id"], name: "index_umrah_packages_on_image_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "roles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "umrah_customers", "flight_inbound_details"
  add_foreign_key "umrah_customers", "flight_outbound_details"
  add_foreign_key "umrah_customers", "umrah_packages"
  add_foreign_key "umrah_packages", "images"
end
