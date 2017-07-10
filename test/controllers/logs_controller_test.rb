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

    url = log_url(Log.last) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /記録は正常に作成されました/
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
    url = log_url(@log) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /記録は正常に更新されました/
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete log_url(@log)
    end

    url = logs_url + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /記録は正常に削除されました/
  end

  test "should show log index when registed store count is 0" do
    @taro = users(:taro)
    login_as(@taro, scope: :user)
    get logs_url
    assert_response :success
  end

  test "should use name_with_order for account" do
    get new_log_url
    id    = accounts(:saifu).id.to_s
    order = accounts(:saifu).order.to_s
    name  = accounts(:saifu).name.to_s
    assert_select "#log_account_id>option[value=?]", id, "#{order}: #{name}"
  end

  test "should use name_with_order for category" do
    get new_log_url
    id    = categories(:food).id.to_s
    order = categories(:food).order.to_s
    name  = categories(:food).name.to_s
    assert_select "#category_category_id>option[value=?]", id, "#{order}: #{name}"
  end

  test "should use name_with_order for sub_category" do
    get new_log_url
    id    = sub_categories(:breakfast).id.to_s
    order = sub_categories(:breakfast).order.to_s
    name  = sub_categories(:breakfast).name.to_s
    assert_select "#log_sub_category_id>option[value=?]", id, "#{order}: #{name}"
  end

  test "should use name_with_order for store" do
    get new_log_url
    id    = stores(:amazon).id.to_s
    order = stores(:amazon).order.to_s
    name  = stores(:amazon).name.to_s
    assert_select "#log_store_id>option[value=?]", id, "#{order}: #{name}"
  end
end
