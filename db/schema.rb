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

ActiveRecord::Schema.define(version: 2020_06_10_122300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "company_id"
    t.string "email"
    t.boolean "is_professional"
    t.string "address"
    t.string "zip_code"
    t.string "country"
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "goods", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "quantity"
    t.float "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goods_on_user_id"
  end

  create_table "join_goods_quotes_tables", force: :cascade do |t|
    t.bigint "good_id"
    t.bigint "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_join_goods_quotes_tables_on_good_id"
    t.index ["quote_id"], name: "index_join_goods_quotes_tables_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "quote_number"
    t.string "invoice_number"
    t.float "amount"
    t.float "discount"
    t.date "quote_sending_date"
    t.date "invoice_sending_date"
    t.integer "quote_sending_counter"
    t.integer "invoice_sending_counter"
    t.boolean "is_invoice"
    t.boolean "is_paid"
    t.bigint "user_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_quotes_on_customer_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "address"
    t.string "zip_code"
    t.string "country", default: "FRANCE"
    t.string "phone_number"
    t.string "company_id"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end