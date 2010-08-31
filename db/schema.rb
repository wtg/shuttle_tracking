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

ActiveRecord::Schema.define(:version => 20100831195654) do

  create_table "coords", :force => true do |t|
    t.decimal  "latitude",   :precision => 15, :scale => 10, :default => 0.0
    t.decimal  "longitude",  :precision => 15, :scale => 10, :default => 0.0
    t.integer  "position"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "enabled",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.integer  "width",       :default => 4
  end

  create_table "routes_stops", :id => false, :force => true do |t|
    t.integer "stop_id"
    t.integer "route_id"
  end

  create_table "statuses", :force => true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code"
    t.boolean  "public",     :default => true
  end

  create_table "stops", :force => true do |t|
    t.string   "name"
    t.decimal  "latitude",   :precision => 15, :scale => 10, :default => 0.0
    t.decimal  "longitude",  :precision => 15, :scale => 10, :default => 0.0
    t.boolean  "enabled",                                    :default => true
    t.string   "phonetic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", :force => true do |t|
    t.integer  "vehicle_id"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "heading"
    t.integer  "speed"
    t.datetime "timestamp"
    t.integer  "lock"
    t.integer  "status_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.string   "identifier"
    t.string   "name"
    t.boolean  "active",     :default => false
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
