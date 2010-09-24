class Icon < ActiveRecord::Base
  # Relations
  has_many :vehicles, :dependent => :nullify 

  # File attachment magic!
  attachable
end
