require "test_helper"

class TeacherdashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teacherdashboard_index_url
    assert_response :success
  end
end
