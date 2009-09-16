class Route < ActiveRecord::Base

  has_and_belongs_to_many :stops

  ##File Storage Attributes
  has_attached_file :kml,
                    :storage => :database,
                    :url =>':relative_root/:class/:attachment/:id'
  
  default_scope select_without_file_columns_for(:kml)

  #Stores an absolute url to the kml file sometimes
  def kml_url
    if self.kml_file_name.nil?
      return ""
    else
      return ABS_PATH + self.kml.url unless self.kml_file_name.nil?
    end
  end
end
