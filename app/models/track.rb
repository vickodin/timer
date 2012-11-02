class Track < ActiveRecord::Base
  attr_accessible :project_id, :stopped_at
  belongs_to :project
end
