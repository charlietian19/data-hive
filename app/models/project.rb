# == Schema Information
#
# Table name: projects
# =>
#  id              :integer          not null, primary key
#  title           :string
#  startdate       :date
#  enddate         :date
#  app_deadline    :date
#  description     :text
#  hours_per_week  :integer
#  compensation    :integer
#  education_level :integer
#  state           :integer          default(1)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessor
  enum state: [:active, :inactive]
  enum education_level: [:undergraduate, :graduate, :both]
  enum compensation: [:units, :paid, :other]
  enum field: [:engineeringcs, :economics]

  has_many :project_tags
  has_many :tags, through: :project_tags
  has_many :applications
  has_many :users, through: :applications
  has_many :questions

# Current_project is project object, tags is array of tag objects
  def add_tags(current_project, tags)
    tags.each do |tag|
      ProjectTag.create(tag: tag, project: current_project)
    end
  end

  def add_questions(current_project, questions)
    questions.each do |q|
      Question.create(project: current_project, title: q)
    end
  end
end
