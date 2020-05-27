# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_27_112438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_details", force: :cascade do |t|
    t.string "auth_code"
    t.string "bin"
    t.string "last_four"
    t.string "brand"
    t.string "country_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "bank"
    t.index ["user_id"], name: "index_card_details_on_user_id"
  end

  create_table "loan_applications", force: :cascade do |t|
    t.integer "req_amount"
    t.integer "repay_amount"
    t.date "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "loan_type_id", null: false
    t.string "account_number"
    t.string "account_name"
    t.string "banks"
    t.index ["loan_type_id"], name: "index_loan_applications_on_loan_type_id"
    t.index ["user_id"], name: "index_loan_applications_on_user_id"
  end

  create_table "loan_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "max_amount"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "interest_rate"
    t.string "image_url"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.string "email"
    t.string "fake_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "card_details", "users"
  add_foreign_key "loan_applications", "loan_types"
  add_foreign_key "loan_applications", "users"
end
