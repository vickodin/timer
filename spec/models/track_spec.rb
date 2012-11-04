require 'spec_helper'

describe Project do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.build(:project)
    @user.projects << @project
    @track = FactoryGirl.build(:track)

  end
  
  it "should not be valid without project" do
    @track.should_not be_valid
  end
  
  it "should be valid" do
    @track.project = @project
    @track.should be_valid
  end
end
