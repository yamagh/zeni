require 'test_helper'

class SubCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Warden.test_mode!
    @user = users( :bob )
    login_as(@user, :scope => :user)
    @category = categories(:food)
    @sub_category = sub_categories(:breakfast)
  end

  #test "should get index" do
  #  get sub_categories_url
  #  assert_response :success
  #end

  test "should get new" do
    get new_category_sub_category_url(@category)
    assert_response :success
  end

  test "should create sub_category" do
    assert_difference('SubCategory.count') do
      post category_sub_categories_url(@category), params: { sub_category: { category_id: @sub_category.category_id, is_disabled: @sub_category.is_disabled, name: @sub_category.name, order: @sub_category.order } }
    end
    url = category_url(@category) + "?locale=ja"
    assert_redirected_to url
    get url
    assert_select ".alert-success", /サブカテゴリは正常に作成されました。/
  end

  #test "should show sub_category" do
  #  get sub_category_url(@sub_category)
  #  assert_response :success
  #end

  test "should get edit" do
    get edit_category_sub_category_url(@category, @sub_category)
    assert_response :success
  end

  test "should update sub_category" do
    patch category_sub_category_url(@category, @sub_category), params: { sub_category: { category_id: @sub_category.category_id, is_disabled: @sub_category.is_disabled, name: @sub_category.name, order: @sub_category.order } }
    url = category_url(@category) + "?locale=ja"
    assert_redirected_to url
    get url
    assert_select ".alert-success", /サブカテゴリは正常に更新されました。/
  end

  test "should destroy sub_category" do
    assert_difference('SubCategory.count', -1) do
      delete category_sub_category_url(@category, @sub_category)
    end
    url = category_url(@category) + "?locale=ja"
    assert_redirected_to url
    get url
    assert_select ".alert-success", /サブカテゴリは正常に削除されました。/
  end

  test "should get sub_categories select_box" do
    get sub_categories_sub_categories_url, params: {category_id: categories(:food).id, format: :js}, xhr: true
    assert_response :success
    assert_select "*", /\$\('#log_sub_category_id'\).html\('1: Breakfast'\)/
  end

  test "should get current_user's sub_categories select_box" do
    get sub_categories_sub_categories_url, params: {category_id: categories(:house).id, format: :js}, xhr: true
    assert_response :success
    assert_select "*", /\$\('#log_sub_category_id'\).html\(''\)/
  end

  test "should get sub_categories select_box when sub_categories is empty" do
    get sub_categories_sub_categories_url, params: {category_id: categories(:car).id, format: :js}, xhr: true
    assert_response :success
    assert_select "*", /\$\('#log_sub_category_id'\).html\(''\)/
  end

  #test "should get sub categories json" do
  #  get sub_categories_sub_categories_url, params: {format: :js, category_id: @category.id}
  #end
end
