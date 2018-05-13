require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "get dashboard should be redirected without login" do
    get dashboard_url
    assert_response :redirect
  end
end
