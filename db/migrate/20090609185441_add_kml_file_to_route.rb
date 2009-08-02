class AddKmlFileToRoute < ActiveRecord::Migration
  def self.up
    add_column :routes, :kml_file_name, :string
    add_column :routes, :kml_content_type, :string
    add_column :routes, :kml_file_size, :integer
    add_column :routes, :kml_updated_at, :datetime
    add_column :routes, :kml_file, :binary
  end

  def self.down
    remove_column :routes, :kml_file_name
    remove_column :routes, :kml_content_type
    remove_column :routes, :kml_file_size
    remove_column :routes, :kml_updated_at
    remove_column :routes, :kml_file, :binary
  end
end
