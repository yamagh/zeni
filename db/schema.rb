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

ActiveRecord::Schema.define(version: 20170624144507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "name",                        null: false
    t.boolean  "is_disabled", default: false, null: false
    t.integer  "order",       default: 0,     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "name",                        null: false
    t.boolean  "is_disabled", default: false, null: false
    t.integer  "order",       default: 0,     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_categories_on_user_id", using: :btree
  end

  create_table "logs", force: :cascade do |t|
    t.integer  "user_id",                                  null: false
    t.datetime "logged_at",       default: -> { "now()" }, null: false
    t.decimal  "ammount",         default: "0.0",          null: false
    t.boolean  "is_expence",      default: true,           null: false
    t.integer  "account_id",                               null: false
    t.integer  "sub_category_id",                          null: false
    t.integer  "store_id"
    t.string   "item",                                     null: false
    t.string   "memo"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["account_id"], name: "index_logs_on_account_id", using: :btree
    t.index ["store_id"], name: "index_logs_on_store_id", using: :btree
    t.index ["sub_category_id"], name: "index_logs_on_sub_category_id", using: :btree
    t.index ["user_id"], name: "index_logs_on_user_id", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "name",                        null: false
    t.string   "tel"
    t.string   "address"
    t.boolean  "is_disabled", default: false, null: false
    t.integer  "order",       default: 0,     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.float    "lat",         default: 0.0
    t.float    "lng",         default: 0.0
    t.index ["user_id"], name: "index_stores_on_user_id", using: :btree
  end

  create_table "sub_categories", force: :cascade do |t|
    t.integer  "category_id",                 null: false
    t.string   "name",                        null: false
    t.boolean  "is_disabled", default: false, null: false
    t.integer  "order",       default: 0,     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "logs", "accounts"
  add_foreign_key "logs", "stores"
  add_foreign_key "logs", "sub_categories"
  add_foreign_key "logs", "users"
  add_foreign_key "stores", "users"
  add_foreign_key "sub_categories", "categories"
end
