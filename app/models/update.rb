class Update < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :status
end
