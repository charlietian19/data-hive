# == Schema Information
#
# Table name: research_applications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer
#

class ResearchApplication < ActiveRecord::Base
  enum status: [:bookmarked, :pending, :approved, :unapproved]

  has_many :tags
  has_many :questions
  belongs_to :user
  belongs_to :project
end
