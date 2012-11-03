require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create new user" do
    assert_difference('User.count') do
      post :create, :user => {
        :email    => 'email@email.com',
        :username     => 'Jimbo',
        :password => "password",
        :password_confirmation => "password"
      }
    end

  end

end
