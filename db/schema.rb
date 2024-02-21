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

ActiveRecord::Schema[7.0].define(version: 2024_02_21_140026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_siteids", force: :cascade do |t|
    t.integer "site_ID"
    t.text "site_Region"
    t.text "site_Country"
    t.text "site_Town"
    t.text "site_Street"
    t.integer "site_NStreet"
    t.integer "site_Postal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apis", force: :cascade do |t|
    t.integer "api_mat"
    t.integer "api_M1"
    t.text "api_Obj1"
    t.text "api_Obj2"
    t.text "api_Obj3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.text "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "empids", force: :cascade do |t|
    t.bigint "emp_ID"
    t.integer "emp_SITEID"
    t.text "emp_FName"
    t.text "emp_LName"
    t.text "emp_CName"
    t.text "emp_Mat"
    t.integer "emp_MatHR"
    t.text "emp_Department"
    t.text "emp_Service"
    t.text "emp_M1"
    t.text "emp_PI_ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "emp_Qualification"
    t.index ["emp_MatHR"], name: "index_empids_on_emp_MatHR", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.text "app_name"
    t.boolean "app_connect"
    t.boolean "app_listing"
    t.boolean "app_read"
    t.boolean "apps_modify"
    t.text "app_context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "siteids", force: :cascade do |t|
    t.integer "site_ID"
    t.text "site_Region"
    t.text "site_Country"
    t.text "site_Town"
    t.text "site_Street"
    t.integer "site_NStreet"
    t.integer "site_Postal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mat_snr", null: false
    t.integer "mat_hr", null: false
  end

  add_foreign_key "blogs", "users"
end
