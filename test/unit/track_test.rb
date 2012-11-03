require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    user1               = users(:first_user)
    project1            = user1.projects.first
    @track1             = Track.new
    @track1.project     = project1
    @track1.stopped_at  = nil
    @track1.save
  end
  
  test "user_2_has_no_tracks" do
    assert_equal 0, users(:second_user).projects.find(:first).tracks.count
  end

  test "track_project_user_relation" do
    assert_equal users(:first_user), @track1.project.user
  end
  
  test "track_project_user_other_relation" do
    assert_not_equal users(:second_user), @track1.project.user
  end
  
  test "cannot_be_more_than_one_current_track_for_one_user" do
    user              = users(:first_user)
    project           = user.projects.first
    track             = Track.new
    track.project     = project
    track.stopped_at  = nil
    
    assert track.invalid?
    assert track.errors[:stopped_at].any?, "Must be errors!"
  end

  test "can_be_more_than_one_current_track_for_all" do
    user              = users(:second_user)
    project           = user.projects.first
    track             = Track.new
    track.project     = project
    track.stopped_at  = nil

    assert track.valid?
    assert track.errors[:stopped_at].empty?, "Can't be errors"
  end
end
