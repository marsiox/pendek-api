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

ActiveRecord::Schema.define(version: 20170824133817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "referers", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_referers_on_url"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "url_id"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at"
    t.bigint "referer_id"
    t.index ["referer_id"], name: "index_sessions_on_referer_id"
    t.index ["url_id"], name: "index_sessions_on_url_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.bigint "url_id"
    t.bigint "referer_id"
    t.bigint "visits"
    t.index ["referer_id"], name: "index_stats_on_referer_id"
    t.index ["url_id"], name: "index_stats_on_url_id"
  end

  create_table "urls", force: :cascade do |t|
    t.string "full"
    t.string "short"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visits"
    t.index ["short"], name: "index_urls_on_short"
  end

end
