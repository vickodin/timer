require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "total_projects_count" do
    assert_equal 3, Project.count
  end

  test "the_same_project_owner" do
    assert_equal projects(:first_project).user.id, projects(:second_project).user.id
  end

  test "the_different_projects_owners" do
    assert_not_equal projects(:first_project).user.id, projects(:other_project).user.id
    assert_not_equal projects(:second_project).user.id, projects(:other_project).user.id
  end

end
