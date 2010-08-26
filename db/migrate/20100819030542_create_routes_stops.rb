class CreateRoutesStops < ActiveRecord::Migration
  def self.up
    create_table :routes_stops, :id => false do |t|
    	t.references :stop
    	t.references :route
  	end
  end

  def self.down
  	drop_table :routes_stops
  end
end
