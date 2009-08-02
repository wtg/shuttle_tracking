class AddUniquePositionIndex < ActiveRecord::Migration
  def self.up
    add_index :positions, [:shuttle_id, :timestamp], :unique => true, :name => 'shuttle_timestamp'
  end

  def self.down
    remove_index :positions, :name => :shuttle_timestamp
  end
end
