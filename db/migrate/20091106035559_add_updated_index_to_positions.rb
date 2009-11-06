class AddUpdatedIndexToPositions < ActiveRecord::Migration
  def self.up
    add_index :positions, [:updated_at] , :name => 'updated_at'
  end

  def self.down
    remove_index :positions, :name => :updated_at
  end
end
