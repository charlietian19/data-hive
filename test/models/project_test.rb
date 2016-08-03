# == Schema Information
#
# Table name: projects
#
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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
