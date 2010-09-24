class CreateIcons < ActiveRecord::Migration
  def self.up
    create_table :icons do |t|
      t.string :name

      t.string :file_name
      t.string :file_type
      t.integer :file_size
      t.binary :file_data, :limit => 2.megabytes

      t.timestamps
    end
    add_column :vehicles, :icon_id, :integer
  end

  def self.down
    drop_table :icons
    remove_column :vehicles, :icon_id
  end
end
