class ChangeStatusIdToStatusCodeOnUpdates < ActiveRecord::Migration
  def self.up
    rename_column :updates, :status_id, :status_code
  end

  def self.down
    rename_column :updates, :status_code, :status_id
  end
end
