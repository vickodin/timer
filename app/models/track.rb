class Track < ActiveRecord::Base
  attr_accessible :project_id, :stopped_at
  belongs_to :project
  #validates :stopped_at, :presence => false, :on => :create
  validates :stopped_at, :uniqueness => {:scope => :project_id}
  validates_presence_of :project
end
