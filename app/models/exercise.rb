class Exercise < ActiveRecord::Base
  
  has_and_belongs_to_many :acts
  # has_many :workouts, :through => :acts
  belongs_to :user
  has_and_belongs_to_many :tags
  
  validates_presence_of :name, :category
  
end