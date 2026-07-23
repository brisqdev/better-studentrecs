require "test_helper"

class ApplicantdashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applicantdashboard_index_url
    assert_response :success
  end
end
