require 'test_helper'
include Sorcery::TestHelpers::Rails

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user_count" do
    assert_equal 2, User.count
  end
end
