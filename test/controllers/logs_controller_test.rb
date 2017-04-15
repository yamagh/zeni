require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Warden.test_mode!
    @user = users( :bob )
    login_as(@user, :scope => :user)
    @log = logs(:one)
  end

  test "should get index" do
    get logs_url
    assert_response :success
  end

  test "should get new" do
    get new_log_url
    assert_response :success
  end

  test "should create log" do
    assert_difference('Log.count') do
      post logs_url, params: { log: { account_id: @log.account_id, ammount: @log.ammount, is_expence: @log.is_expence, item: @log.item, logged_at: @log.logged_at, memo: @log.memo, store_id: @log.store_id, sub_category_id: @log.sub_category_id, user_id: @log.user_id } }
    end

    assert_redirected_to log_url(Log.last) + '?locale=ja'
  end

  test "should show log" do
    get log_url(@log)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_url(@log)
    assert_response :success
  end

  test "should update log" do
    patch log_url(@log), params: { log: { account_id: @log.account_id, ammount: @log.ammount, is_expence: @log.is_expence, item: @log.item, logged_at: @log.logged_at, memo: @log.memo, store_id: @log.store_id, sub_category_id: @log.sub_category_id, user_id: @log.user_id } }
    assert_redirected_to log_url(@log) + '?locale=ja'
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete log_url(@log)
    end

    assert_redirected_to logs_url + '?locale=ja'
  end
end
