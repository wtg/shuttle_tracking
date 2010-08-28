require 'test_helper'

class StopTest < ActiveSupport::TestCase
  # Quick validations
  test "attributes must be set" do
    stop = Stop.new
    assert stop.invalid?
    assert stop.errors[:name].any?
  end
  
  # The valid range for a latitude should be
  # -90 <= x <= 90.
  test "latitude  must be valid" do
    stop = Stop.new(:name => "Test Stop")
    assert stop.valid?, "0,0 is valid"
    
    good = [0, 10.5, -1.1, 90, -90]
    bad = ["a", "", nil, -90.1, 90.00001]
    
    good.each do |lat|
      stop = Stop.new(:name => "A Stop",
                        :latitude => lat)
      assert stop.valid?, "#{lat} should be valid"
    end
    
    bad.each do |lat|
      stop = Stop.new(:name => "A Stop",
                        :latitude => lat)
      assert stop.invalid?, "#{lat} should be invalid"
    end
  end

  # The valid range for a latitude should be
  # -180 <= x <= 180.
  test "longitude  must be valid" do
    stop = Stop.new(:name => "Test Stop")
    assert stop.valid?, "0,0 is valid"
    
    good = [0, 10.5, -1.1, 180, -180]
    bad = ["a", "", nil, -180.1, 180.00001]
    
    good.each do |long|
      stop = Stop.new(:name => "A Stop",
                        :longitude => long)
      assert stop.valid?, "#{long} should be valid"
    end
    
    bad.each do |long|
      stop = Stop.new(:name => "A Stop",
                        :longitude => long)
      assert stop.invalid?, "#{long} should be invalid"
    end
  end
  
end
