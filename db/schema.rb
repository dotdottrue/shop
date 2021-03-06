# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150225170003) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "shipping_method_id",       default: 1
    t.integer  "payment_id",               default: 1
    t.string   "invoice_firstname"
    t.string   "invoice_lastname"
    t.integer  "invoice_zipcode"
    t.string   "invoice_site"
    t.string   "invoice_street"
    t.string   "invoice_country"
    t.string   "invoice_company"
    t.string   "shipping_firstname"
    t.string   "shipping_lastname"
    t.integer  "shipping_zipcode"
    t.string   "shipping_site"
    t.string   "shipping_street"
    t.string   "shipping_country"
    t.string   "shipping_company"
    t.boolean  "optional_invoice_address", default: true
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  create_table "order_line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "product_name"
    t.text     "product_short_description"
    t.text     "product_description"
    t.decimal  "product_price",             precision: 8, scale: 2
    t.decimal  "product_vat_rate",          precision: 8, scale: 2
    t.integer  "product_quantity"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_number"
    t.integer  "user_id"
    t.decimal  "total_vat",                precision: 8, scale: 2
    t.decimal  "total_price",              precision: 8, scale: 2
    t.datetime "order_date"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "status",                                           default: 0
    t.string   "invoice_firstname"
    t.string   "invoice_lastname"
    t.integer  "invoice_zipcode"
    t.string   "invoice_site"
    t.string   "invoice_street"
    t.string   "invoice_country"
    t.string   "invoice_company"
    t.string   "shipping_firstname"
    t.string   "shipping_lastname"
    t.integer  "shipping_zipcode"
    t.string   "shipping_site"
    t.string   "shipping_street"
    t.string   "shipping_country"
    t.string   "shipping_company"
    t.boolean  "optional_invoice_address"
    t.integer  "shipping_method_id"
    t.integer  "payment_id"
    t.string   "shipping_method_name"
    t.decimal  "shipping_method_price"
    t.integer  "line_items"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id"
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",               precision: 8, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "short_description"
    t.decimal  "vat_rate"
    t.boolean  "in_stock",                                    default: true
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "username"
    t.text     "description"
    t.integer  "grade"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shipping_methods", force: :cascade do |t|
    t.string   "name"
    t.string   "duration"
    t.decimal  "price",      precision: 8, scale: 2
    t.decimal  "vat_rate",   precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "street"
    t.string   "zipcode"
    t.string   "site"
    t.string   "country"
    t.string   "telephone"
    t.date     "birth"
    t.string   "company"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
