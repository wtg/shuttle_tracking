class CreateIndices < ActiveRecord::Migration
  def self.up
    add_index "statuses", ["code"], :name => "index_statuses_on_code", :unique => true
  	add_index "positions", ["shuttle_id", "timestamp"], :name => "shuttle_timestamp", :unique => true
  	add_index "positions", ["shuttle_id"], :name => "shuttle_id"
  	add_index "positions", ["updated_at"], :name => "updated_at"
  end

  def self.down	

  end
end
