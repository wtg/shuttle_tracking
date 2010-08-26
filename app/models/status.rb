class Status < ActiveRecord::Base
  has_many :updates
end
