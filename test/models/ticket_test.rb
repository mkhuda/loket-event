require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  test "ticket count test from ticket fixture" do
    assert_equal 4, Ticket.count, "Ticket should be 4"
  end

  test "create ticket by Event ID" do
    assert Event.find(1).tickets.create(ticket_name: "Another regular ticket").save,
      "Create ticket with ticket_name"
  end

  test "failed create ticket by Event ID" do
    assert_not Event.find(1).tickets.create.save, "Create failed ticket with all nil"
  end

  test "clear all tickets by Event ID" do
    tickets = Event.find(1).tickets.clear
    assert_not tickets.exists?, "Tickets should be cleared"
  end

  test "find tickets by Event ID" do
    assert_equal false, Event.find(1).tickets.empty?, "Tickets should be found"
  end
end
