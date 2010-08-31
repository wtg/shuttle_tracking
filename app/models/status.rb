class Status < ActiveRecord::Base

  # Relations
  has_many :updates, :foreign_key => :status_code, :primary_key => :code
  
  # Validations
  validates :code, :uniqueness => true
end
