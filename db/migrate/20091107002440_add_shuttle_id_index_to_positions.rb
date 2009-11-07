class AddShuttleIdIndexToPositions < ActiveRecord::Migration
  def self.up
    add_index :positions, [:shuttle_id] , :name => 'shuttle_id'
  end

  def self.down
    remove_index :positions, :name => :shuttle_id
  end
end
