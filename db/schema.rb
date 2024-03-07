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

ActiveRecord::Schema[7.0].define(version: 2024_03_06_133851) do
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

  create_table "entretiens", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "mathr"
    t.integer "m1"
    t.integer "year"
    t.integer "age"
    t.text "obj01"
    t.text "obj02"
    t.text "obj03"
    t.text "obj04"
    t.text "obj05"
    t.text "obj06"
    t.text "obj07"
    t.text "obj08"
    t.text "obj09"
    t.text "obj10"
    t.text "obj11"
    t.text "obj12"
    t.text "obj13"
    t.text "obj14"
    t.text "obj15"
    t.text "obj16"
    t.text "obj17"
    t.text "obj18"
    t.text "obj19"
    t.text "obj20"
    t.text "obj21"
    t.text "obj22"
    t.text "obj23"
    t.text "obj24"
    t.text "obj25"
    t.text "obj26"
    t.text "obj27"
    t.text "obj28"
    t.text "obj29"
    t.text "obj30"
    t.text "obj31"
    t.text "obj32"
    t.text "obj33"
    t.text "obj34"
    t.text "obj35"
    t.text "obj36"
    t.text "obj37"
    t.text "obj38"
    t.text "obj39"
    t.text "obj40"
    t.text "obj41"
    t.text "obj42"
    t.text "obj43"
    t.text "obj44"
    t.text "obj45"
    t.text "obj46"
    t.text "obj47"
    t.text "obj48"
    t.text "obj49"
    t.text "obj50"
    t.text "obj51"
    t.text "obj52"
    t.text "obj53"
    t.text "obj54"
    t.text "obj55"
    t.text "obj56"
    t.text "obj57"
    t.text "obj58"
    t.text "obj59"
    t.text "obj60"
    t.text "obj61"
    t.text "obj62"
    t.text "obj63"
    t.text "obj64"
    t.text "obj65"
    t.text "obj66"
    t.text "obj67"
    t.text "obj68"
    t.text "obj69"
    t.text "obj70"
    t.text "obj71"
    t.text "obj72"
    t.text "obj73"
    t.text "obj74"
    t.text "obj75"
    t.text "obj76"
    t.text "obj77"
    t.text "obj78"
    t.text "obj79"
    t.text "obj80"
    t.text "obj81"
    t.text "obj82"
    t.text "obj83"
    t.text "obj84"
    t.text "obj85"
    t.text "obj86"
    t.text "obj87"
    t.text "obj88"
    t.text "obj89"
    t.text "obj90"
    t.text "obj91"
    t.text "obj92"
    t.text "obj93"
    t.text "obj94"
    t.text "obj95"
    t.text "obj96"
    t.text "obj97"
    t.text "obj98"
    t.text "obj99"
    t.text "obj100"
    t.boolean "obj101"
    t.boolean "obj102"
    t.boolean "obj103"
    t.boolean "obj104"
    t.boolean "obj105"
    t.boolean "obj106"
    t.boolean "obj107"
    t.boolean "obj108"
    t.boolean "obj109"
    t.boolean "obj110"
    t.boolean "obj111"
    t.boolean "obj112"
    t.boolean "obj113"
    t.boolean "obj114"
    t.boolean "obj115"
    t.boolean "obj116"
    t.boolean "obj117"
    t.boolean "obj118"
    t.boolean "obj119"
    t.boolean "obj120"
    t.boolean "obj121"
    t.boolean "obj122"
    t.boolean "obj123"
    t.boolean "obj124"
    t.boolean "obj125"
    t.boolean "obj126"
    t.boolean "obj127"
    t.boolean "obj128"
    t.boolean "obj129"
    t.boolean "obj130"
    t.boolean "obj131"
    t.boolean "obj132"
    t.boolean "obj133"
    t.boolean "obj134"
    t.boolean "obj135"
    t.boolean "obj136"
    t.boolean "obj137"
    t.boolean "obj138"
    t.boolean "obj139"
    t.boolean "obj140"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_entretiens_on_user_id"
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

  create_table "personnes", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "siteid", null: false
    t.string "fname", null: false
    t.string "lname", null: false
    t.string "cname", null: false
    t.integer "matsnr", null: false
    t.integer "mathr", null: false
    t.string "department", null: false
    t.string "service", null: false
    t.integer "m1", null: false
    t.string "qualification", null: false
    t.date "bdate", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personnes_on_user_id"
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
    t.integer "matsnr", null: false
    t.integer "mathr", null: false
  end

  add_foreign_key "entretiens", "users"
  add_foreign_key "personnes", "users"
end
