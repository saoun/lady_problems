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

ActiveRecord::Schema.define(version: 20161008182029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "owners"
    t.string   "category"
    t.string   "title"
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "content"
    t.integer  "user_id"
    t.integer  "pitch_id"
    t.index ["pitch_id"], name: "index_feedbacks_on_pitch_id", using: :btree
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "location", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "description"
    t.string   "category"
    t.string   "looking_for"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "board_id"
    t.index ["board_id"], name: "index_posts_on_board_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.text     "bio"
    t.text     "img"
    t.string   "email"
    t.string   "location"
    t.string   "area_of_interest"
    t.string   "years_of_expertise"
    t.string   "past_employment"
    t.string   "twitter_link"
    t.string   "linked_in_link"
    t.string   "github_link"
    t.string   "facebook_link"
    t.boolean  "admin"
    t.boolean  "web_developer"
    t.boolean  "project_mgmt"
    t.boolean  "marketing"
    t.boolean  "ux_ui"
    t.boolean  "data_analytics"
    t.boolean  "human_resources"
    t.boolean  "finance"
    t.boolean  "business_development"
    t.text     "other"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "feedbacks", "pitches"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "posts", "boards"
  add_foreign_key "posts", "users"
end
