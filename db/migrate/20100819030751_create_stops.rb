class CreateStops < ActiveRecord::Migration
  def self.up
    create_table :stops do |t|
	    t.string   :name
	    t.decimal  :latitude,   :precision => 15, :scale => 10, :default => 0
	    t.decimal  :longitude,  :precision => 15, :scale => 10, :default => 0
	    t.boolean  :enabled, :default => true
	    t.string   :phonetic
	    t.timestamps
  	end
  end

  def self.down
  	drop_table :stops
  end
end
