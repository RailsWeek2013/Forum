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

ActiveRecord::Schema.define(version: 20131223132615) do

  create_table "posts", force: true do |t|
    t.string   "title",                          null: false
    t.text     "content",                        null: false
    t.boolean  "spam",           default: false, null: false
    t.integer  "user_thread_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                        null: false
  end

  add_index "posts", ["user_thread_id"], name: "index_posts_on_user_thread_id"

  create_table "private_messages", force: true do |t|
    t.text     "content"
    t.string   "title"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "readed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.string   "type",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["user_id", "post_id"], name: "index_rates_on_user_id_and_post_id", unique: true

  create_table "topics", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["name"], name: "index_topics_on_name", unique: true

  create_table "user_threads", force: true do |t|
    t.string   "title",      null: false
    t.integer  "topic_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    null: false
  end

  add_index "user_threads", ["title"], name: "index_user_threads_on_title", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "lastname",               default: "", null: false
    t.string   "name",                   default: "", null: false
    t.date     "birthday"
    t.string   "gender"
    t.string   "signature"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
