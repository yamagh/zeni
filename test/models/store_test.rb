require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  def setup
    @bob = users(:bob)
  end

  test "can create" do
    assert_difference ('Store.count') do
      Store.create user_id: @bob.id, name: "Amazon"
    end
  end

  test "should have name" do
    assert_no_difference ('Store.count') do
      Store.create user_id: @bob.id
    end

    assert_no_difference ('Store.count') do
      Store.create user_id: @bob.id, name: ""
    end
  end

  test "should be 1-50 length name" do
    assert_difference ('Store.count') do
      Store.create user_id: @bob.id, name: "a"
    end

    assert_difference ('Store.count') do
      Store.create user_id: @bob.id, name: [*1..50].map{"a"}*''
    end

    assert_no_difference ('Store.count') do
      Store.create user_id: @bob.id, name: [*1..51].map{"a"}*''
    end
  end

  test "'is_disabled' default value should be false" do
    s = Store.create user_id: @bob.id, name: "a"
    assert_equal( false, s.is_disabled )
  end

  test "'order' default value should be 0" do
    s = Store.create user_id: @bob.id, name: "a"
    assert_equal( 0, s.order )
  end

  test "'lat' and 'lng' default value should be 0" do
    s = Store.create user_id: @bob.id, name: "a"
    assert_equal( 0, s.lat )
    assert_equal( 0, s.lng )
  end

  test "name_with_order" do
    assert_equal "1: Amazon", stores(:amazon).name_with_order
  end

  test "should use order number in name_with_order" do
    foo = Store.create user_id: @bob.id, name: "foo", order: 123
    assert_equal "123: foo", foo.name_with_order
  end
end
