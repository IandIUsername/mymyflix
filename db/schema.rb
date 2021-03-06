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

ActiveRecord::Schema.define(version: 20141114014450) do

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", force: true do |t|
    t.integer  "inviter_id"
    t.string   "recipient_name"
    t.string   "recipient_email"
    t.text     "messages"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  create_table "queue_items", force: true do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "leader_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "video_id"
    t.string   "reviewable_type"
    t.integer  "reviewable_id"
    t.integer  "rating"
    t.text     "content"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.boolean  "admin_flag"
  end

  create_table "videos", force: true do |t|
    t.string   "video_image_url"
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "cover_image_url"
    t.string   "large_cover_url"
    t.integer  "category_id"
    t.integer  "user_id"
  end

end
