class AddShortNameToStops < ActiveRecord::Migration
  def self.up
    add_column :stops, :short_name, :string
  end

  def self.down
    remove_column :stops, :short_name
  end
end
