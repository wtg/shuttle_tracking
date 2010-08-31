class Route < ActiveRecord::Base

  # Relations
  has_and_belongs_to_many :stops
  has_many :coords, :dependent => :destroy
  
  # Validations
  validates :name, :presence => true
  validates :width, :numericality => { :greater_than_or_equal_to => 0 }

  accepts_nested_attributes_for :coords, :allow_destroy => true
end
