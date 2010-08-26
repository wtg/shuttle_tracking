class CreateUpdates < ActiveRecord::Migration
  def self.up
    create_table :updates do |t|
      t.references :vehicle
      t.decimal :latitude
      t.decimal :longitude
      t.integer :heading
      t.integer :speed
      t.datetime :timestamp
      t.integer :lock
      t.references :status

      t.timestamps
    end
  end

  def self.down
    drop_table :updates
  end
end
