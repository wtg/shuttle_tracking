class Route < ActiveRecord::Base

  has_and_belongs_to_many :stops

  #Stores an absolute url to the kml file sometimes
  attr_accessor :kml_url
end
