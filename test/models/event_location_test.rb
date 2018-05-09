require 'test_helper'

class EventLocationTest < ActiveSupport::TestCase
  test "count location used by event" do
    assert_equal 2, EventLocation.count, "Location of Event count should be 2"
  end

  test "add location of event from existing location" do
    event = Event.create(user_id: 1, name: "Event test", event_detail: "Test event detail with location")
    assert event.create_event_location(location_id: 1), "Use GBK after creating an event"
  end

  test "just only one location in event" do
    event = Event.find(1)
    assert_raise ActiveRecord::RecordNotUnique do 
      event.create_event_location(location_id: 2) 
    end 
  end

  test "user create new event and set the location" do
    user_add_event = User.find(1).events.create(name: "Event test", event_detail: "Test event details")
    user_add_location = Location.create(name: "New Location")
    assert user_add_event.create_event_location(location_id: user_add_location.id).save, "Location saved to event"
  end
end
