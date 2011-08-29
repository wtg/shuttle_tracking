class Stop < ActiveRecord::Base
  # Callbacks
  before_save :convert_short_name 

  # Relations
  has_and_belongs_to_many :routes
  
  # Validations
  validates :name, :presence => true
  validates :short_name, :presence => true, :uniqueness => true
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}
 
  # Scopes, so I don't have to type so much.
  scope :enabled, where(:enabled => true)
  scope :disabled, where(:enabled => false)

  # I prefer to use the short name instead of the ID.
  def to_param
    short_name
  end

  # Convert the short-name to a parameter, which in
  # this case tolerates [A-z0-9\-]
  def convert_short_name
    self.short_name = self.short_name.parameterize
    true # So the save doesn't give up?
  end

end
