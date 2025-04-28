require "test_helper"

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get attend" do
    get attendances_attend_url
    assert_response :success
  end

  test "should get show" do
    get attendances_show_url
    assert_response :success
  end
end
