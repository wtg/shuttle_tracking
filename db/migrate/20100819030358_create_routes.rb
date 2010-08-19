class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
	    t.string   :name
	    t.text     :description
	    t.time     :start_time,  :default => '2000-01-01 00:00:00'
	    t.time     :end_time,    :default => '2000-01-01 00:00:00'
	    t.boolean  :enabled
	    t.timestamps
	    t.string   :color
	    t.integer  :width,	:default => 4
	    t.text     :coords
  	end
  end

  def self.down
  	drop_table :routes
  end
end
