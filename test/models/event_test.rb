require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "event count test from event fixture" do
    assert_equal 3, Event.count, "Event fixture should be 3"
  end

  test "create a succesfull event" do
    event = Event.new
    event.user_id = 1
    event.name = "Event Test"
    event.event_detail = "Event Details"
    assert_equal true, event.save, "Event should be created"
  end

  test "create a failed event with nil user_id" do
    event = Event.new
    assert_not event.save, "Should be false or failed to save"
  end

  test "find all event by User ID 1" do
    assert_not_nil User.find(1).events, "Events should be not nil according user fixtures"
  end

  test "find published events" do
    assert_equal 2, Event.where("publish = true").count, "Published events should be 2"
  end

  test "find unpublished events" do
    assert_equal 1, Event.where("publish = false").count, "Published events should be 1"
  end
end
