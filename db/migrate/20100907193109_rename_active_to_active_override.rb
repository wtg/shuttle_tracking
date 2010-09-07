class RenameActiveToActiveOverride < ActiveRecord::Migration
  def self.up
    rename_column :vehicles, :active, :active_override
  end

  def self.down
    rename_column :vehicles, :active, :active_override
  end
end
