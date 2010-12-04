class AddVehicleTimestampIndexToUpdates < ActiveRecord::Migration
  def self.up
    add_index :updates, [:vehicle_id, :timestamp]
  end

  def self.down
    remove_index :updates, [:vehicle_id, :timestamp]
  end
end
