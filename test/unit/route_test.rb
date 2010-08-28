require 'test_helper'

class RouteTest < ActiveSupport::TestCase
  # Quick and dirty validation test.
  test "validations" do
    r = Route.new
    assert r.invalid?
    r.name = "Foo"
    r.width = 0
    assert r.save
  end
end
