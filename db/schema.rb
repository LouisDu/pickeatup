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

ActiveRecord::Schema.define(version: 20160315103318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "picture"
    t.time     "prep_time"
    t.text     "description"
    t.integer  "meal_type_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "meals", ["meal_type_id"], name: "index_meals_on_meal_type_id", using: :btree
  add_index "meals", ["restaurant_id"], name: "index_meals_on_restaurant_id", using: :btree

  create_table "order_lines", force: :cascade do |t|
    t.float    "meal_price"
    t.integer  "meal_quantity"
    t.integer  "meal_id"
    t.integer  "order_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "order_lines", ["meal_id"], name: "index_order_lines_on_meal_id", using: :btree
  add_index "order_lines", ["order_id"], name: "index_order_lines_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "pick_up_time"
    t.float    "bill"
    t.string   "status",       default: "Pending"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "phone_number"
    t.string   "picture"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "restaurant_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "street_number"
    t.string   "route"
    t.string   "locality"
    t.string   "administrative_area_level_1"
    t.string   "postal_code"
    t.string   "country"
    t.string   "logo"
    t.integer  "restaurant_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "restaurants", ["restaurant_type_id"], name: "index_restaurants_on_restaurant_type_id", using: :btree
  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "content"
    t.integer  "meal_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["meal_id"], name: "index_reviews_on_meal_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "meals", "meal_types"
  add_foreign_key "meals", "restaurants"
  add_foreign_key "order_lines", "meals"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "restaurants", "restaurant_types"
  add_foreign_key "restaurants", "users"
  add_foreign_key "reviews", "meals"
  add_foreign_key "reviews", "users"
end
