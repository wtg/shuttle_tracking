class CorrectLatLngOnUpdate < ActiveRecord::Migration
  def self.up
    change_column :updates, :latitude, :decimal, :precision => 15, :scale => 10, :default => 0.0
    change_column :updates, :longitude, :decimal, :precision => 15, :scale => 10, :default => 0.0
  end

  def self.down
    change_column :updates, :latitude, :decimal
    change_column :updates, :longitude, :decimal
  end
end
