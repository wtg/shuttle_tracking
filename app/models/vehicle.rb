class Vehicle < ActiveRecord::Base

  # Relations
  has_many :updates, :dependent => :destroy

  # Validations
  validates :name, :presence => true
  validates :identifier, :uniqueness => true, :allow_nil => true
  
  # Is the vehicle is considered active or not?
  # This can be overridden with the active_override flag,
  # but it defaults to detect motion within 3 minutes.
  def active?(threshold = 180)
    active_override? || (offline_for <= threshold)
  end

  # Compute how long it has been since the vehicle last moved.
  # Returns number of seconds or Infinity
  def offline_for
    if updates.latest_position.first.nil?
      1/0.0 #Aka Infinity
    else
    (Time.now - updates.latest_position.first.timestamp)
    end
  end
    
end
