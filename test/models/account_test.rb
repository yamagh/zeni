require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @bob = users(:bob)
  end

  test "can create new account" do
    assert_difference ('Account.count') do
      Account.create user_id: @bob.id, name: "Bank"
    end
  end

  test "default value of order is 0" do
    bank = Account.create(user_id: @bob.id, name: "Bank")
    assert_equal( bank.order, 0 ) 
  end

  test "default value of is_disabled is false" do
    bank = Account.create(user_id: @bob.id, name: "Bank")
    assert_equal( bank.is_disabled, false ) 
  end

  test "should have name" do
    assert_no_difference ('Account.count') do
      Account.create user_id: @bob.id
    end
  end

  test "should have 1-50 length name" do
    assert_no_difference ('Account.count') do
      Account.create user_id: @bob.id, name: ""
    end

    assert_difference ('Account.count') do
      Account.create user_id: @bob.id, name: "a"
    end

    assert_difference ('Account.count') do
      Account.create user_id: @bob.id, name: [*1..50].map{"a"}*''
    end

    assert_no_difference ('Account.count') do
      Account.create user_id: @bob.id, name: [*1..51].map{"a"}*''
    end
  end
end
