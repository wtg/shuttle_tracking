class Vehicle < ActiveRecord::Base

  # Every vehicle that has an identifier must have a unique one.
  validates :identifier, :uniqueness => true, :allow_nil => true, :allow_blank => true
  has_many :positions
  
  def current_position
    self.positions.find(:first, :order => 'updated_at DESC')
  end
    
end
