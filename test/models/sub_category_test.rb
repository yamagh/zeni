require 'test_helper'

class SubCategoryTest < ActiveSupport::TestCase
  def setup
    @bob = users(:bob)
    @food = categories(:food)
    @breakfast = sub_categories(:breakfast)
  end

  test "can create" do
    assert_difference ('SubCategory.count') do
      SubCategory.create category_id: @food.id, name: "Drink"
    end
  end

  test "should have name" do
    assert_no_difference ('SubCategory.count') do
      SubCategory.create category_id: @food.id
    end
  end

  test "should be 1~50 length name" do
    assert_no_difference ('SubCategory.count') do
      SubCategory.create category_id: @food.id, name: ""
    end

    assert_difference ('SubCategory.count') do
      SubCategory.create category_id: @food.id, name: [*1..50].map{"a"}*''
    end

    assert_no_difference ('SubCategory.count') do
      SubCategory.create category_id: @food.id, name: [*1..51].map{"b"}*''
    end
  end

  test "defalt value of is_disabled is false" do
    d = SubCategory.create category_id: @food.id, name: "Drink"
    assert_equal( d.is_disabled, false )
  end

  test "defalt value of order is 0" do
    d = SubCategory.create category_id: @food.id, name: "Drink"
    assert_equal( d.order, 0 )
  end

  test "name with order" do
    assert_equal "1: Breakfast", @breakfast.name_with_order
  end

  test "should use order number in name_with_order" do
    foo = SubCategory.create category_id: @food.id, name: "foo", order: 123
    assert_equal "123: foo", foo.name_with_order
  end

  test "name_with_long_order" do
    assert_equal "11: Breakfast", @breakfast.name_with_long_order
  end
end
