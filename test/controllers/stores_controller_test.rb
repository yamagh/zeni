require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    Warden.test_mode!
    @user = users( :bob )
    login_as(@user, :scope => :user)
    @store = stores(:amazon)
  end

  test "should get index" do
    get stores_url
    assert_response :success
  end

  test "should get new" do
    get new_store_url
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post stores_url, params: { store: { address: @store.address, is_disabled: @store.is_disabled, name: @store.name, order: @store.order, tel: @store.tel, user_id: @store.user_id } }
    end

    assert_redirected_to store_url(Store.last) + '?locale=ja'
  end

  test "should show store" do
    get store_url(@store)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_url(@store)
    assert_response :success
  end

  test "should update store" do
    patch store_url(@store), params: { store: { address: @store.address, is_disabled: @store.is_disabled, name: @store.name, order: @store.order, tel: @store.tel, user_id: @store.user_id } }
    assert_redirected_to store_url(@store) + '?locale=ja'
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete store_url(@store)
    end

    assert_redirected_to stores_url + '?locale=ja'
  end
end
