class Route < ActiveRecord::Base

  # Relations
  has_and_belongs_to_many :stops
  
  # Validations
  validates :name, :presence => true
  validates_numericality_of :width, :greater_than_or_equal_to => 0
end
