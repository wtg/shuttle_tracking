class Update < ActiveRecord::Base

  # Relations
  belongs_to :vehicle
  belongs_to :status
  
  # Validations 
  validates :longitude,
    :numericality => true,
    :inclusion => { :in => -180..180 },
    :allow_nil => true    
  validates :latitude,
    :numericality => true,
    :inclusion => { :in => -90..90},
    :allow_nil => true # or longitude for that matter
  validates_presence_of :vehicle # Every update must have a vehicle...
  validates_associated :vehicle # ... and that vehicle must exist
end
