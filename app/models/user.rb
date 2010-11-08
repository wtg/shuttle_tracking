class User < ActiveRecord::Base
  devise :cas_authenticatable, :trackable

end
