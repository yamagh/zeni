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

    url = store_url(Store.last) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /お店は正常に作成されました。/
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

    url = store_url(@store) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /お店は正常に更新されました。/
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete store_url(@store)
    end

    url = stores_url + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /お店は正常に削除されました。/
  end

  test "should can control only current_user's store" do
    get edit_store_url(stores(:apple))
    assert_response :missing

    get store_url(stores(:apple))
    assert_response :missing

    patch store_url(stores(:apple)), params: { store: { is_disabled: false, name: "a", order: 1, user_id: users(:taro).id } }
    assert_response :missing

    put store_url(stores(:apple)), params: { store: { is_disabled: false, name: "a", order: 1, user_id: users(:taro).id } }
    assert_response :missing

    delete store_url(stores(:apple))
    assert_response :missing
  end
end
