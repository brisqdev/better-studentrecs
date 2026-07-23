require "test_helper"

class CounselordashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get counselordashboard_index_url
    assert_response :success
  end
end
