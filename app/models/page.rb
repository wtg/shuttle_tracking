class Page < ActiveRecord::Base
  # Scopes, so I don't have to type so much.
  scope :frontpage, where(:frontpage => true)

  def to_param
    permalink
  end
end
