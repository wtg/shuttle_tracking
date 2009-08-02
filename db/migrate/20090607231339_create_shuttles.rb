class CreateShuttles < ActiveRecord::Migration
  def self.up
    create_table :shuttles do |t|
      t.string :ip
      t.string :name
      t.boolean :active
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :shuttles
  end
end
