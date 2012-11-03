require 'test_helper'
include Sorcery::TestHelpers::Rails

class UserTest < ActiveSupport::TestCase
  test "total_user_count" do
    assert_equal 2, User.count
  end

  test "users_have_different_emails" do
    assert_not_equal users(:first_user).email, users(:second_user).email
  end

  test "user1_have_two_projects" do
    assert_equal 2, users(:first_user).projects.count
  end

  test "user2_have_one_projects" do
    assert_equal 1, users(:second_user).projects.count
  end
end
