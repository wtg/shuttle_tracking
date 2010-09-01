class Update < ActiveRecord::Base

  # Relations
  belongs_to :vehicle
  belongs_to :status, :foreign_key => :status_code, :primary_key => :code
  
  # Validations 
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }, :allow_nil => true    
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}, :allow_nil => true
  validates :heading, :numericality => true, :inclusion => { :in => 0...360}, :allow_nil => true
  validates :speed, :numericality => {:greater_than_or_equal_to => 0}, :allow_nil => true
  validates :vehicle, :presence => true, :associated => true

  # Scope
  # Default order by the timestamp
  default_scope order('timestamp DESC')
  
  # Identify the most recent location. 
  # You probably want to chain this like:
  # Vehicle.find(1).updates.latest_position
  scope :latest_position, where('latitude IS NOT NULL').where('longitude IS NOT NULL').limit(1)
end
