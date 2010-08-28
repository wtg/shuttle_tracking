class Vehicle < ActiveRecord::Base

  # Relations
  has_many :updates, :dependent => :destroy

  # Validations
  validates :name, :presence => true
  validates :identifier, :uniqueness => true, :allow_nil => true
  
  #ToDo: Add current_position replacement here.
    
end
