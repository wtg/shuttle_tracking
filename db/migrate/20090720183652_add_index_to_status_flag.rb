class AddIndexToStatusFlag < ActiveRecord::Migration
  def self.up
    add_index(:statuses, :code, {:unique => true})
  end

  def self.down
    remove_index(:statuses, :code)
  end 
end
