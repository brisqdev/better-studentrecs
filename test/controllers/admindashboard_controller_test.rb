require "test_helper"

class AdmindashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admindashboard_index_url
    assert_response :success
  end
end
