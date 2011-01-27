class Vehicle < ActiveRecord::Base

  # Relations
  has_many :updates, :dependent => :destroy
  has_one :latest_position, :class_name => 'Update'
  belongs_to :icon

  # Validations
  validates :name, :presence => true
  validates :identifier, :uniqueness => true, :allow_nil => true
  
  # Identify all the vehicles that are active AND enabled.
  # Probably useful to show these on a map.
  def self.active
    vehicles = where(:enabled => true)
    vehicles.delete_if { |v| !v.active? }
  end

  # Is the vehicle is considered active or not?
  # This can be overridden with the active_override flag,
  # but it defaults to detect motion within 3 minutes.
  def active?(threshold = ACTIVE_TIMEOUT)
    active_override? || (offline_for <= threshold)
  end

  # Compute how long it has been since the vehicle last moved.
  # Returns number of seconds or Infinity
  def offline_for
    if latest_position.nil?
      1/0.0 #Aka Infinity
    else
    (Time.now - latest_position.timestamp)
    end
  end

end
