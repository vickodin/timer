require 'spec_helper'

describe UserSessionsController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    #login_user @user
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should be able to login" do
      post :create, :email => @user.email, :password => 'please'
      response.should redirect_to(root_url)
    end

    it "should be able to logout" do
      login_user
      get :destroy
      response.should redirect_to(root_url)
    end
  end

end
