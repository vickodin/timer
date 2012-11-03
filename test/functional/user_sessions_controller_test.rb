require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get login page" do
    get :new
    assert_response :success
  end

  test "should login" do
    post :create, :email => 'first@example.com', :password => 'secret1', :remember => '1'
    assert flash[:notice]
    assert_redirected_to root_url
  end

  test "should not login" do
    post :create, :email => 'first@example.com', :password => 'secret2', :remember => '1'
    assert_response :success
    assert flash[:alert]
  end
end
