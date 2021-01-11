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

ActiveRecord::Schema.define(version: 2021_01_11_010118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "image_url"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "heading"
    t.string "title"
    t.text "address"
    t.text "description"
    t.integer "max_guests"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.float "longitude"
    t.float "latitude"
    t.float "cleaning_fee"
    t.float "service_fee"
    t.text "street"
    t.text "city"
    t.text "state"
    t.text "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "property_type"
    t.integer "listing_price"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "booking_code"
    t.date "from_date"
    t.date "to_date"
    t.string "property_id"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "trxn_code"
    t.string "trxn_status", default: "pending"
    t.string "pay_method"
    t.float "total_paid", default: 0.0
    t.integer "guests_count"
  end

  create_table "reservations_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "reservation_id", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
