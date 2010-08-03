require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # Make sure that a vehicle that has a identifier has a unique one.
  test "uniquness of identifiers" do
    vehicle = Vehicle.new(:name => "Test Vehicle",
                          :identifier => vehicles(:bus_one).identifier)
    assert vehicle.invalid?
    assert_equal I18n.translate('activerecord.errors.messages.taken'),vehicle.errors[:identifier].join('; ')
    
    vehicle.identifier = nil
    assert vehicle.valid?
    
    vehicle.identifier = ""
    assert vehicle.valid?
  end
end
