class Coord < ActiveRecord::Base

  # Relations
  belongs_to :route

  # Validations
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}
  validates_presence_of :route
  validates_associated :route
end
