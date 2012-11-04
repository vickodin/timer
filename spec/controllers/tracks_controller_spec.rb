require 'spec_helper'

describe TracksController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    login_user
    @project = FactoryGirl.build(:project)
    @user.projects << @project
    @track = FactoryGirl.build(:track)
    @project.tracks << @track
  end

  describe "GET 'index'" do
    it "should not be successful" do
      get :index, :project_id => @project.id
      response.should redirect_to(projects_path)
    end
  end
  
  describe "Get 'show'" do
    it "should be successful" do
      get :show, :project_id => @project.id, :id => @track.id
      response.should_not be_success
      response.should redirect_to(projects_path)
    end
  end

  describe "Track 'create'" do
    it "should_not be create" do
      post :create, :project_id => @project.id, :track => {}
      flash[:alert].should == 'Error'
      response.should redirect_to(assigns(:project))
      #get :show, :id => project.id
      #assigns(:project).id.should == project.id
    end
  end

  describe "Track 'stop'" do
    it "should be stop" do
      post :update, :project_id => @project.id, :id => @track.id
      flash[:notice].should == 'Track was successfully stopped.'
      response.should redirect_to(assigns(:project))
    end
    it "should be stop and able to create new" do
      post :update, :project_id => @project.id, :id => @track.id
      response.should redirect_to(assigns(:project))
      post :create, :project_id => @project.id, :track => {}
      flash[:notice].should == 'Track was successfully created.'
      response.should redirect_to(assigns(:project))
    end
    it "should be stop and should not be able to create twice" do
      post :update, :project_id => @project.id, :id => @track.id
      response.should redirect_to(assigns(:project))
      post :create, :project_id => @project.id, :track => {}
      flash[:notice].should == 'Track was successfully created.'
      response.should redirect_to(assigns(:project))
      post :create, :project_id => @project.id, :track => {}
      flash[:alert].should == 'Error'
      response.should redirect_to(assigns(:project))
    end

  end

=begin
  describe "Show Project" do
    it "should be successfull" do
      get :show, :id => @project.id
      response.should be_success
    end
  end
  
  describe "Edit Project" do
    render_views
    it "should be editable" do
      get :edit, :id => @project.id
      response.should be_success
    end
    
    it "should be updated" do
      post :update, :id => @project.id, :project => {:name => "Another Name"}
      response.should redirect_to(@project)

      get :show, :id => @project.id
      response.body.should =~ /Another Name/m
    end
  end
=end

end
