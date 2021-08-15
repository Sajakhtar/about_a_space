require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get my_account" do
    get dashboard_my_account_url
    assert_response :success
  end
end
