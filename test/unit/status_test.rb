require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # Quick and dirty validation test.
  test "validations" do
    s = Status.new(:code => statuses(:one).code)
    assert s.invalid?
    s.code = "Foo"
    assert s.valid?
    assert s.save
  end
end
