class Status < ActiveRecord::Base

  # Relations
  has_many :updates
  
  # Validations
  validates_uniqueness_of :code
end
