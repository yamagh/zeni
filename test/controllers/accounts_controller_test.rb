require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Warden.test_mode!
    @user = users( :bob )
    login_as(@user, :scope => :user)
    @account = accounts(:saifu)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { is_disabled: @account.is_disabled, name: @account.name, order: @account.order, user_id: @account.user_id } }
    end

    url = account_url(Account.last) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /口座は正常に作成されました。/
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { is_disabled: @account.is_disabled, name: @account.name, order: @account.order, user_id: @account.user_id } }
    url = account_url(@account) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /口座は正常に更新されました。/
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    url = accounts_url + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /口座は正常に削除されました。/
  end
end
