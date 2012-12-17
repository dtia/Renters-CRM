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

ActiveRecord::Schema.define(:version => 20121217082050) do

  create_table "applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.date     "start_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "cc_type"
    t.integer  "cc_num"
    t.date     "exp_date"
    t.integer  "sec_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "properties", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.date     "avail_date"
    t.integer  "price"
    t.integer  "deposit"
    t.integer  "beds"
    t.integer  "baths"
    t.boolean  "has_parking"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "fbid"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "role"
    t.string   "phone"
    t.integer  "ssn"
    t.integer  "credit_score"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
