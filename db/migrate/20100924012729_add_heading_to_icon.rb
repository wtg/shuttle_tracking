class AddHeadingToIcon < ActiveRecord::Migration
  def self.up
    add_column :icons, :heading, :integer, :default => 0
  end

  def self.down
    remove_column :icons, :heading
  end
end
