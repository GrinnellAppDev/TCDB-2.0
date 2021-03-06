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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130104020616) do

  create_table "lab_times", :force => true do |t|
    t.datetime "open"
    t.datetime "close"
    t.integer  "lab_id"
    t.integer  "day_of_week"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "labs", :force => true do |t|
    t.integer  "lab_id"
    t.string   "labname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shift_times", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "lab_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shift_times", ["lab_id"], :name => "index_shift_times_on_lab_id"

  create_table "shifts", :force => true do |t|
    t.boolean  "filled"
    t.integer  "lab_id"
    t.integer  "user_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "time_workeds", :force => true do |t|
    t.integer  "lab_id"
    t.integer  "user_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "comment"
    t.integer  "shift_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "payrate"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "password_digest"
    t.string   "phone"
    t.string   "pCard"
    t.string   "boxNum"
    t.string   "rank"
    t.string   "username"
    t.string   "remember_token"
    t.string   "year"
    t.string   "photo_url"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
