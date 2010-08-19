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

ActiveRecord::Schema.define(:version => 20100819030858) do

  create_table "positions", :force => true do |t|
    t.integer  "shuttle_id"
    t.decimal  "latitude",   :precision => 15, :scale => 10
    t.decimal  "longitude",  :precision => 15, :scale => 10
    t.integer  "heading"
    t.integer  "speed"
    t.datetime "timestamp"
    t.integer  "lock"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["shuttle_id", "timestamp"], :name => "shuttle_timestamp", :unique => true
  add_index "positions", ["shuttle_id"], :name => "shuttle_id"
  add_index "positions", ["updated_at"], :name => "updated_at"

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "start_time",  :default => '2000-01-01 00:00:00'
    t.time     "end_time",    :default => '2000-01-01 00:00:00'
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.integer  "width",       :default => 4
    t.text     "coords"
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
    t.boolean  "public"
  end

  add_index "statuses", ["code"], :name => "index_statuses_on_code", :unique => true

  create_table "stops", :force => true do |t|
    t.string   "name"
    t.decimal  "latitude",   :precision => 15, :scale => 10
    t.decimal  "longitude",  :precision => 15, :scale => 10
    t.boolean  "enabled"
    t.string   "phoentic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.string   "identifier"
    t.string   "name"
    t.boolean  "active"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
