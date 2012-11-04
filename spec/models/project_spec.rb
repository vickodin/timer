require 'spec_helper'

describe Project do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.build(:project)
    #@user.projects << @project

  end
  
  it "should require name" do
    @project = FactoryGirl.build(:project)
    @project.name = nil
    @project.should_not be_valid
  end

  it "should require user" do
    @project = FactoryGirl.build(:project)
    @project.should_not be_valid
  end
  
  it "should be valid" do
    @project.user = @user
    @project.should be_valid
  end
end
