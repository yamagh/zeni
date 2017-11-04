require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Warden.test_mode!
    @bob = users( :bob )
    login_as(@bob, :scope => :user)
    @wallet = accounts(:wallet)
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
      post accounts_url, params: { account: { is_disabled: @wallet.is_disabled, name: @wallet.name, order: @wallet.order, user_id: @wallet.user_id } }
    end

    url = account_url(Account.last) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /口座は正常に作成されました。/
  end

  test "should show account" do
    get account_url(@wallet)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@wallet)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@wallet), params: { account: { is_disabled: @wallet.is_disabled, name: @wallet.name, order: @wallet.order, user_id: @wallet.user_id } }
    url = account_url(@wallet) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /口座は正常に更新されました。/
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@wallet)
    end

    url = accounts_url + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /口座は正常に削除されました。/
  end
end
