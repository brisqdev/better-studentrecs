require "test_helper"

class StaffdashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staffdashboard_index_url
    assert_response :success
  end
end
