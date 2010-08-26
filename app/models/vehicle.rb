class Vehicle < ActiveRecord::Base

  # Every vehicle that has an identifier must have a unique one.
  validates :identifier, :uniqueness => true, :allow_nil => true, :allow_blank => true
  
  #ToDo: Add current_position replacement here.
    
end
