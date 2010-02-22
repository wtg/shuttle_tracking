class CreateArchivePositionTable < ActiveRecord::Migration
  def self.up
    create_table "archive_positions", :force => true do |t|
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
  end

  def self.down
    drop_table "archive_positions"
  end
end
