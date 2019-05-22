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

ActiveRecord::Schema.define(version: 2019_05_17_005925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aromas", force: :cascade do |t|
    t.string "aroma_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "region_name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasting_terms", force: :cascade do |t|
    t.string "term"
    t.string "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "varietals", force: :cascade do |t|
    t.string "varietal_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wine_aromas", force: :cascade do |t|
    t.integer "aroma_id"
    t.integer "wine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wine_tasting_terms", force: :cascade do |t|
    t.integer "tasting_term_id"
    t.integer "wine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wines", force: :cascade do |t|
    t.integer "varietal_id"
    t.integer "user_id"
    t.string "producer"
    t.string "wine_name"
    t.string "wine_type"
    t.integer "country_id"
    t.boolean "biodynamic"
    t.boolean "organic"
    t.date "date_added"
    t.string "price_range"
    t.integer "vintage"
    t.integer "rating"
    t.text "notes"
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
