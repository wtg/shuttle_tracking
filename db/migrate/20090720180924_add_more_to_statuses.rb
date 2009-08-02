class AddMoreToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :code, :integer
    add_column :statuses, :public, :boolean
  end

  def self.down
    remove_column :statuses, :public
    remove_column :statuses, :code
  end
end
