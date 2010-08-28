class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
	    t.string   :name
	    t.text     :description
	    t.time     :start_time
	    t.time     :end_time
	    t.boolean  :enabled, :default => true
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
