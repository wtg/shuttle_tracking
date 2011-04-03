class AddInfoToStops < ActiveRecord::Migration
  def self.up
    add_column :stops, :description, :text
    add_column :stops, :address, :string
    add_column :stops, :time_served, :string
  end

  def self.down
    remove_column :stops, :description
    remove_column :stops, :address
    remove_column :stops, :time_served
  end
end
