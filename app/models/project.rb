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
  enum state: [:active, :inactive]
  enum education_level: [:undergraduate, :graduate, :both]
  enum compensation: [:units, :paid, :other]
  enum field: [:engineeringcs, :economics]

  has_many :project_tags
  has_many :tags, through: :project_tags
  has_many :applications
  has_many :users, through: :applications

# Current_project is project object, tags is array of tag objects
  def add_tags(current_project, tags)
    tags.each do |tag|
      ProjectTag.create(tag: tag, project: current_project)
    end
  end

  def add_positions(current_project, positions)
    all_positions = positions.values
    all_positions.each do |position|
      if !position.nil?
        current_project.positions.push(position)
      end
    end
  end

end
