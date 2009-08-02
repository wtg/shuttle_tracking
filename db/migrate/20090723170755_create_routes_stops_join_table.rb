class CreateRoutesStopsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :routes_stops, :id => false do |t|
      t.integer :stop_id
      t.integer :route_id
    end
    remove_column(:stops, :route_id)
  end

  def self.down
    drop_table :stops_routes
    add_column(:stops, :route_id, :integer)
  end
end
