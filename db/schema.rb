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

ActiveRecord::Schema.define(:version => 20130110220107) do

  create_table "application_data", :force => true do |t|
    t.string   "curr_street_address"
    t.string   "curr_city"
    t.string   "curr_state"
    t.integer  "curr_zip"
    t.date     "curr_date_in"
    t.date     "curr_date_out"
    t.string   "curr_landlord"
    t.string   "curr_landlord_phone"
    t.text     "curr_reason_leave"
    t.string   "prev_street_address"
    t.string   "prev_city"
    t.string   "prev_state"
    t.integer  "prev_zip"
    t.date     "prev_date_in"
    t.date     "prev_date_out"
    t.string   "prev_landlord"
    t.string   "prev_landlord_phone"
    t.text     "prev_reason_leave"
    t.string   "occupation"
    t.string   "employer"
    t.integer  "salary"
    t.string   "supervisor"
    t.string   "supervisor_phone"
    t.date     "employer_start"
    t.date     "employer_end"
    t.string   "employer_address"
    t.string   "employer_city"
    t.string   "employer_state"
    t.integer  "employer_zip"
    t.string   "emerg_name"
    t.string   "emerg_address"
    t.string   "emerg_phone"
    t.string   "emerg_relationship"
    t.string   "ref_name"
    t.string   "ref_address"
    t.string   "ref_phone"
    t.string   "ref_relationship"
    t.boolean  "pets"
    t.boolean  "bankruptcy"
    t.boolean  "refuse_rent"
    t.boolean  "evicted"
    t.text     "evicted_reason"
    t.boolean  "convicted"
    t.text     "convicted_reason"
    t.string   "vehicle_make_model"
    t.integer  "vehicle_year"
    t.string   "vehicle_license_state"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "userid"
  end

  create_table "applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.date     "start_date"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "application_data_id"
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
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.string   "unit"
    t.integer  "zip"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "uid"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "role"
    t.string   "phone"
    t.integer  "ssn"
    t.integer  "credit_score"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
