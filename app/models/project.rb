class Project < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  belongs_to :user
  has_many :tracks, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :user
end
