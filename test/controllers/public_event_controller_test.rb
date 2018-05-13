require 'test_helper'

class PublicEventControllerTest < ActionDispatch::IntegrationTest
  test "should get index of public event" do
    get public_event_url
    assert_response :success
  end

  test "should get event detail of public event" do
    get show_public_event_url(1)
    assert_response :success
  end

end
