require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "count all locations" do
    assert_equal 2, Location.count, "Locations should be 2"
  end
end
