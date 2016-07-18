class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags

  has_many :project_tags
  has_many :projects, through: :project_tags

  enum programming_language: [:Java, :Python, :C, :Ruby, :Javascript]
  enum courses: [:CS61A, :Data8]
  enum domain: []
end
