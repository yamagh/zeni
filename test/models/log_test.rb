require 'test_helper'

class LogTest < ActiveSupport::TestCase
  def setup
    @bob = users(:bob)
    @coffee = Log.create user_id: @bob.id, 
                         account_id: accounts(:wallet).id, 
                         sub_category_id: sub_categories(:breakfast).id,
                         item: "Coffee"
  end

  test "can create" do
    assert_difference ('Log.count') do
      Log.create user_id: @bob.id, 
                 account_id: accounts(:wallet).id, 
                 sub_category_id: sub_categories(:breakfast).id,
                 item: "Coffee"
    end
  end

  test "`logged_at` default value is now" do
    assert_in_delta( DateTime.now.to_i, Log.find(@coffee.id).logged_at.to_i, 3 )
  end

  test "ammount default value is 0" do
    assert_equal( 0, @coffee.ammount )
  end

  test "`is_expence` default value is true" do
    assert_equal( true, @coffee.is_expence )
  end

  test "ammount should be decimal" do
    assert_no_difference 'Log.count' do
      Log.create user_id:         @bob.id,
                 account_id:      @coffee.account_id,
                 sub_category_id: @coffee.sub_category_id,
                 item:            "Tea",
                 ammount:         "1,000"
    end
  end

  test "amount should be greater than or equal to 0" do
    @coffee.ammount = -1
    @coffee.save
    assert_not_equal -1, Log.find(@coffee.id).ammount

    assert_no_difference 'Log.count' do
      Log.create user_id: @bob.id,
                 account_id: @coffee.account_id,
                 sub_category_id: @coffee.sub_category_id,
                 item: "Tea",
                 ammount: -1
    end
  end

  test "amount should be less than 1,000,000,000,000,000" do
    @coffee.ammount = 999_999_999_999_999
    @coffee.save
    assert_equal 999_999_999_999_999, Log.find(@coffee.id).ammount

    @coffee.ammount = 1_000_000_000_000_000
    @coffee.save
    assert_not_equal 1_000_000_000_000_000, Log.find(@coffee.id).ammount
  end
end
