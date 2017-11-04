require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Warden.test_mode!
    @bob = users( :bob )
    login_as(@bob, :scope => :user)
    @food = categories(:food)
    @house = categories(:house)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { is_disabled: @food.is_disabled, name: @food.name, order: @food.order, user_id: @food.user_id } }
    end

    url = category_url(Category.last) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /カテゴリは正常に作成されました/
  end

  test "should show category" do
    get category_url(@food)
    assert_response :success
  end

  test "should Not show category" do
    get category_url(@house)
    assert_response :bad_request
  end

  test "should get edit" do
    get edit_category_url(@food)
    assert_response :success
  end

  test "should Not get edit" do
    get edit_category_url(@house)
    assert_response :bad_request
  end

  test "should update category" do
    patch category_url(@food), params: { category: { is_disabled: @food.is_disabled, name: @food.name, order: @food.order, user_id: @food.user_id } }
    url =  category_url(@food) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /カテゴリは正常に更新されました/
  end

  test "should Not update category" do
    patch category_url(@house), params: { category: { is_disabled: @house.is_disabled, name: @house.name, order: @house.order, user_id: @house.user_id } }
    assert_response :bad_request
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@food)
    end

    url =  categories_url + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /カテゴリは正常に削除されました/
  end

  test "should Not destroy category" do
    assert_no_difference 'Category.count' do
      delete category_url(@house)
      assert_response :bad_request
    end
  end

  test "should can control only current_user's category" do
    get edit_category_url(@house)
    assert_response :bad_request

    get category_url(@house)
    assert_response :bad_request

    patch category_url(@house), params: { category: { is_disabled: false, name: "a", order: 1, user_id: users(:taro).id } }
    assert_response :bad_request

    put category_url(@house), params: { category: { is_disabled: false, name: "a", order: 1, user_id: users(:taro).id } }
    assert_response :bad_request

    delete category_url(@house)
    assert_response :bad_request
  end
end
