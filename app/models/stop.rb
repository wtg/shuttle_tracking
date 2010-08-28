class Stop < ActiveRecord::Base

  # Relations
  has_and_belongs_to_many :routes
  
  # Validations
  validates :name, :presence => true
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}

end
