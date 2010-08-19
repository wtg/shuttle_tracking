class CreatePositions < ActiveRecord::Migration
  def self.up
	  create_table :positions do |t|
	    t.integer  :shuttle_id
	    t.decimal  :latitude,   :precision => 15, :scale => 10
	    t.decimal  :longitude,  :precision => 15, :scale => 10
	    t.integer  :heading
	    t.integer  :speed
	    t.datetime :timestamp
	    t.integer  :lock
	    t.integer  :status_id
	    t.timestamps
	  end  
  end

  def self.down
  	drop_table :positions
  end
end
