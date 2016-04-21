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

ActiveRecord::Schema.define(version: 20160420191932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_sets", force: :cascade do |t|
    t.string   "set_type"
    t.string   "name"
    t.string   "code"
    t.date     "release_date"
    t.string   "block"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image_dir"
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.string   "mana_cost"
    t.integer  "converted_cost"
    t.string   "card_type"
    t.string   "rarity"
    t.text     "text"
    t.text     "flavor"
    t.string   "artist"
    t.string   "power"
    t.string   "toughness"
    t.integer  "card_set_id"
    t.string   "card_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "colors",                      array: true
    t.integer  "subtypes",                    array: true
    t.text     "supertypes",                  array: true
    t.integer  "multiverse_id"
  end

  create_table "deck_cards", force: :cascade do |t|
    t.integer  "deck_id"
    t.integer  "card_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
