class Status < ActiveRecord::Base

  # Relations
  has_many :updates
  
  # Validations
  validates :code, :uniqueness => true
end
