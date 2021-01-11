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

ActiveRecord::Schema.define(version: 2021_01_10_084005) do

  create_table "grnv_bar_infos", force: :cascade do |t|
    t.string "grnv_id"
    t.string "address"
    t.string "name"
    t.string "image"
    t.string "grnv_url"
    t.string "grnv_tel"
    t.string "opentime"
    t.string "holiday"
    t.string "tel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string "user_id"
    t.string "grnv_bar_info_id"
    t.string "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "munis", force: :cascade do |t|
    t.string "prefecture_no"
    t.string "prefecture_name"
    t.string "muni_cd"
    t.string "muni_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
