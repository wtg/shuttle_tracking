class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string :identifier
      t.string :name
      t.boolean :active, :default => false
      t.boolean :enabled, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
