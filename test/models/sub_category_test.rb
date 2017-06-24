require 'test_helper'

class SubCategoryTest < ActiveSupport::TestCase
  def setup
    @bob = users(:bob)
    @food = categories(:food)
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
end
