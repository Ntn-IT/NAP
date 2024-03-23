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

ActiveRecord::Schema[7.1].define(version: 2024_03_09_143231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", id: :string, force: :cascade do |t|
    t.integer "siteid", null: false
    t.string "fname", null: false
    t.string "lname", null: false
    t.string "cname", null: false
    t.integer "matsnr", null: false
    t.string "department", null: false
    t.string "service", null: false
    t.integer "m1", null: false
    t.string "qualification", null: false
    t.date "bdate", null: false
    t.string "status", default: "ouvrier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "review_periods", force: :cascade do |t|
    t.string "status", default: "in_progress", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_templates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", null: false
    t.string "title", null: false
    t.json "json_document", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "status", default: "in_progress", null: false
    t.integer "review_period_id", null: false
    t.datetime "date", precision: nil
    t.string "employee_id", null: false
    t.string "employee_fname", null: false
    t.string "employee_lname", null: false
    t.string "employee_qualification", null: false
    t.integer "employee_seniority", null: false
    t.string "manager_id", null: false
    t.string "manager_fname", null: false
    t.string "manager_lname", null: false
    t.string "manager_qualification", null: false
    t.json "json_document", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_period_id", "employee_id"], name: "index_reviews_on_review_period_id_and_employee_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employee_id", null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count"
    t.string "roles", default: [], array: true
    t.index ["employee_id"], name: "index_users_on_employee_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
