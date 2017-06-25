require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Warden.test_mode!
    @user = users( :bob )
    login_as(@user, :scope => :user)
  end

  test "should get show" do
    get dashboards_show_url
    assert_response :success
  end
end
