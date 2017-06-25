require 'test_helper'

class LogTest < ActiveSupport::TestCase
  def setup
    @bob = users(:bob)
    @coffee = Log.create user_id: @bob.id, 
                         account_id: accounts(:saifu).id, 
                         sub_category_id: sub_categories(:breakfast).id,
                         item: "Coffee"
  end

  test "can create" do
    assert_difference ('Log.count') do
      Log.create user_id: @bob.id, 
                 account_id: accounts(:saifu).id, 
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
end
