require 'spec_helper'

describe ProjectsController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    login_user
    @project = FactoryGirl.build(:project)
    @user.projects << @project
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should be able to view projects" do
      get :index
      assigns(:projects).count.should == @user.projects.count
    end
  end

  describe "Get 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "Project 'create'" do
    it "should be create" do
      post :create, :project => {:name => "Another Projects"}
      project = assigns(:project)
      response.should redirect_to(assigns(:project))
      
      get :show, :id => project.id
      assigns(:project).id.should == project.id
    end
  end

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
end
