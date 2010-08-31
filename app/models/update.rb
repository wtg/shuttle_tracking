class Update < ActiveRecord::Base

  # Relations
  belongs_to :vehicle
  belongs_to :status
  
  # Validations 
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }, :allow_nil => true    
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}, :allow_nil => true
  validates :heading, :numericality => true, :inclusion => { :in => 0...360}, :allow_nil => true
  validates :speed, :numericality => {:greater_than_or_equal_to => 0}, :allow_nil => true
  validates :vehicle, :presence => true, :associated => true
end
