class CreateCoords < ActiveRecord::Migration
  def self.up
    create_table :coords do |t|
      t.decimal :latitude, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.integer :position
      t.references :route

      t.timestamps
    end
    remove_column :routes, :coords
  end

  def self.down
    drop_table :coords
    add_column :routes, :coords, :text
  end
end
