# == Schema Information
#
# Table name: tags
#
#  id       :integer          not null, primary key
#  category :integer
#  tag      :string
#

class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags

  has_many :project_tags
  has_many :projects, through: :project_tags

  enum category: [:programming_languages, :courses, :domain]
end
