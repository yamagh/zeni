require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Warden.test_mode!
    @user = users( :bob )
    login_as(@user, :scope => :user)
    @category = categories(:food)
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
      post categories_url, params: { category: { is_disabled: @category.is_disabled, name: @category.name, order: @category.order, user_id: @category.user_id } }
    end

    url = category_url(Category.last) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /カテゴリは正常に作成されました/
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { is_disabled: @category.is_disabled, name: @category.name, order: @category.order, user_id: @category.user_id } }
    url =  category_url(@category) + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /カテゴリは正常に更新されました/
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    url =  categories_url + '?locale=ja'
    assert_redirected_to url
    get url
    assert_select ".alert-success", /カテゴリは正常に削除されました/
  end
end
