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

  test "should be 50 or less length name" do
    assert_difference ('SubCategory.count') do
      SubCategory.create category_id: @food.id, name: [*1..50].map{"a"}*''
    end

    assert_no_difference ('SubCategory.count') do
      SubCategory.create category_id: @food.id, name: [*1..51].map{"a"}*''
    end
  end
end
