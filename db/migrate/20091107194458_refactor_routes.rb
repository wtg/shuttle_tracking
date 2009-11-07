class RefactorRoutes < ActiveRecord::Migration
  def self.up
    add_column :routes, :color, :string
    add_column :routes, :width, :integer, :default => 4
    add_column :routes, :coords, :text
    
    remove_column :routes, :kml_file_name
    remove_column :routes, :kml_content_type
    remove_column :routes, :kml_file_size
    remove_column :routes, :kml_updated_at
    remove_column :routes, :kml_file
  end

  def self.down
    add_column :routes, :kml_file_name, :string
    add_column :routes, :kml_content_type, :string
    add_column :routes, :kml_file_size, :integer
    add_column :routes, :kml_updated_at, :datetime
    add_column :routes, :kml_file, :binary
    
    remove_column :routes, :color
    remove_column :routes, :width
    remove_column :routes, :coords
  end
end
