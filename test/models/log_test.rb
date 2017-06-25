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
end
