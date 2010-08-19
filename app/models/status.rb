class Status < ActiveRecord::Base
  has_many :positions, :foreign_key => :code
end
