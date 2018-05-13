require 'test_helper'

class PublicEventControllerTest < ActionDispatch::IntegrationTest
  test "should get index of public event" do
    get public_event_url
    assert_response :success
  end
end
