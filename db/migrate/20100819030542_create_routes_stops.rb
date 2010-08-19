class CreateRoutesStops < ActiveRecord::Migration
  def self.up
    create_table :routes_stops, :id => false do |t|
    	t.integer :stop_id
    	t.integer :route_id
  	end
  end

  def self.down
  	drop_table :routes_stops
  end
end
