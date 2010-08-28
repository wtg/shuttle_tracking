require 'test_helper'

class UpdateTest < ActiveSupport::TestCase
  # Quick validations
  test "attributes must be set" do
    update = Update.new
    assert update.invalid?
    update.vehicle = vehicles(:bus_one)
    assert update.save
  end
  
  # The valid range for a latitude should be
  # -90 <= x <= 90.
  test "latitude  must be valid" do
    update = Update.new(:vehicle => vehicles(:bus_one))
    assert update.valid?, "nil,nil is valid"
    
    good = [nil, 0, 10.5, -1.1, 90, -90]
    bad = ["a", -90.1, 90.00001]
    
    good.each do |lat|
      update = Update.new(:vehicle => vehicles(:bus_one),
                        :latitude => lat)
      assert update.valid?, "#{lat} should be valid"
    end
    
    bad.each do |lat|
      update = Update.new(:vehicle => vehicles(:bus_one),
                        :latitude => lat)
      assert update.invalid?, "#{lat} should be invalid"
    end
  end
  
  # The valid range for a latitude should be
  # -180 <= x <= 180.
  test "longitude  must be valid" do
    update = Update.new(:vehicle => vehicles(:bus_one))
    assert update.valid?, "nil,nil is valid"
    
    good = [nil, 0, 10.5, -1.1, 180, -180]
    bad = ["a", -180.1, 180.00001]
    
    good.each do |long|
      update = Update.new(:vehicle => vehicles(:bus_one),
                        :longitude => long)
      assert update.valid?, "#{long} should be valid"
    end
    
    bad.each do |long|
      update = Update.new(:vehicle => vehicles(:bus_one),
                        :longitude => long)
      assert update.invalid?, "#{long} should be invalid"
    end
  end

end
