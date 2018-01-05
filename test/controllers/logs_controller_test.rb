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

  test "should show names of account sub/category, store" do
    get log_url(@log)  
    assert_select "*", Regexp.new(accounts(:wallet).name)
    assert_select "*", Regexp.new(categories(:food).name)
    assert_select "*", Regexp.new(sub_categories(:breakfast).name)
    assert_select "*", Regexp.new(stores(:amazon).name)
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
    id    = accounts(:wallet).id.to_s
    order = accounts(:wallet).order.to_s
    name  = accounts(:wallet).name.to_s
    assert_select "#log_account_id>option[value=?]", id, "#{order}: #{name}"
  end

  test "should use name_with_order for category" do
    get new_log_url
    id    = categories(:food).id.to_s
    order = categories(:food).order.to_s
    name  = categories(:food).name.to_s
    assert_select "#category_category_id>option[value=?]", id, "#{order}: #{name}"
  end

  test "should use name_with_long_order for sub_category" do
    get new_log_url
    id    = sub_categories(:breakfast).id.to_s
    order = sub_categories(:breakfast).order.to_s
    name  = sub_categories(:breakfast).name.to_s
    cat_order = categories(:food).order.to_s
    assert_select "#log_sub_category_id>option[value=?]", id, "#{cat_order}#{order}: #{name}"
  end

  test "should use name_with_order for store" do
    get new_log_url
    id    = stores(:amazon).id.to_s
    order = stores(:amazon).order.to_s
    name  = stores(:amazon).name.to_s
    assert_select "#log_store_id>option[value=?]", id, "#{order}: #{name}"
  end

  test "should show buttons in log_url" do
    get log_url(@log)
    assert_response :success
    assert_select "a[href='" + logs_path({locale: :ja}) + "']"
    assert_select "a[href='" + edit_log_path(@log, {locale: :ja}) + "']"
    assert_select "a[href='" + new_log_path({locale: :ja, log_id: @log.id}) + "']"
    assert_select "a[href='" + log_path(@log, {locale: :ja}) + "']"
  end

  test "should can copy log" do
    get new_log_url, params: {log_id: @log.id}
    assert_response :success
    assert_select "#log_logged_at_1i>option[selected='selected']", @log.logged_at.year.to_s
    assert_select "#log_logged_at_2i>option[selected='selected']", @log.logged_at.month.to_s
    assert_select "#log_logged_at_3i>option[selected='selected']", @log.logged_at.day.to_s
    assert_select "#log_logged_at_4i>option[selected='selected']", "%02d" % @log.logged_at.hour.to_s
    assert_select "#log_logged_at_5i>option[selected='selected']", "%02d" % @log.logged_at.min.to_s
    assert_select "#log_ammount[value=?]",                         @log.ammount.to_i.to_s
    if @log.is_expence
      assert_select "input#log_is_expence[checked='checked']"
    else
      assert_select "input#log_is_expence:not([checked])"
    end
    assert_select "#log_account_id>option[selected]",       Account.find(@log.account_id).name_with_order
    assert_select "#category_category_id>option[selected]", Category.find(sub_categories(:breakfast).category_id).name_with_order
    assert_select "#log_sub_category_id>option[selected]",  SubCategory.find(@log.sub_category_id).name_with_long_order
    assert_select "#log_store_id>option[selected]",         Store.find(@log.store_id).name_with_order
    assert_select "#log_item[value=?]",    @log.item
    assert_select "#log_memo",             @log.memo
  end

  test "should can control current_user's log" do
    get log_url(logs(:two))
    assert_response :bad_request

    get edit_log_url(logs(:two))
    assert_response :bad_request

    patch log_url(logs(:two))
    assert_response :bad_request

    put log_url(logs(:two))
    assert_response :bad_request

    delete log_url(logs(:two))
    assert_response :bad_request
  end

  test "amount number format" do
    get logs_url
    assert_select "td:eq(2)", /^9,999$/

    get log_url(@log)
    assert_select "p:eq(2)", /^金額:9,999円$/

    get edit_log_url
    assert_select "#log_ammount[value='9999']"
  end

  test "should show search options" do
    get logs_url
    assert_select "input#q_is_expence_eq"
    assert_select "select#q_account_id_eq"
    assert_select "select#q_sub_category_category_id_eq"
    assert_select "select#q_sub_category_id_eq"
    assert_select "select#q_store_id_eq"
    assert_select "input#q_item_cont"
    assert_select "input#q_memo_cont"
  end
end
