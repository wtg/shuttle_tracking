class RemoveDecimalFromStops < ActiveRecord::Migration
  def self.up
    remove_column(:stops, :decimal)
  end

  def self.down
    add_column(:stops, :decimal, :decimal, {:precision => 15, :scale => 10})
  end
end
