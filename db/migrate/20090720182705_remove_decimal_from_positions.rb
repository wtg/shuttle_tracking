class RemoveDecimalFromPositions < ActiveRecord::Migration
  def self.up
    remove_column(:positions, :decimal)
  end

  def self.down
    add_column(:positions, :decimal, :decimal, {:precision => 15, :scale => 10})
  end
end
