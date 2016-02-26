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

ActiveRecord::Schema.define(version: 20160226065029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clicks", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "user_id"
    t.integer  "score_card_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "clicks", ["animal_id"], name: "index_clicks_on_animal_id", using: :btree
  add_index "clicks", ["score_card_id"], name: "index_clicks_on_score_card_id", using: :btree
  add_index "clicks", ["user_id"], name: "index_clicks_on_user_id", using: :btree

  create_table "contests", force: :cascade do |t|
    t.string   "name"
    t.integer  "day"
    t.string   "prize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "score_cards", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contest_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "score_cards", ["contest_id"], name: "index_score_cards_on_contest_id", using: :btree
  add_index "score_cards", ["user_id"], name: "index_score_cards_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
