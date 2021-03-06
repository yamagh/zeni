require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @bob = users(:bob)
    @food = categories(:food)
  end

  test "can create new category" do
    assert_difference ('Category.count') do
      Category.create user_id: @bob.id, name: "foods"
    end
  end

  test "default value of order is 0" do
    foods = Category.create(user_id: @bob.id, name: "foods")
    assert_equal( foods.order, 0 ) 
  end

  test "default value of is_disabled is false" do
    foods = Category.create(user_id: @bob.id, name: "foods")
    assert_equal( foods.is_disabled, false ) 
  end

  test "should have name" do
    assert_no_difference ('Category.count') do
      Category.create user_id: @bob.id
    end
  end

  test "should have 1-50 length name" do
    assert_no_difference ('Category.count') do
      Category.create user_id: @bob.id, name: ""
    end

    assert_difference ('Category.count') do
      Category.create user_id: @bob.id, name: "a"
    end

    assert_difference ('Category.count') do
      Category.create user_id: @bob.id, name: [*1..50].map{"a"}*''
    end

    assert_no_difference ('Category.count') do
      Category.create user_id: @bob.id, name: [*1..51].map{"a"}*''
    end
  end

  test "name_with_order" do
    assert_equal "1: Food", @food.name_with_order
  end

  test "should use order number in name_with_order" do
    foo = Category.create user_id: @bob.id, name: "foo", order: 123
    assert_equal "123: foo", foo.name_with_order
  end
end
