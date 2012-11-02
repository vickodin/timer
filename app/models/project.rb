class Project < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  belongs_to :user

  validates_presence_of :name
end
