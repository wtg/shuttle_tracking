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

  # Convert the short-name to lowercase, which
  # I am treating as the lowest common denominator.
  def convert_short_name
    short_name.downcase!
    true # So the save doesn't give up?
  end

end
