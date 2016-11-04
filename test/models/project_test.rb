# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  title           :string
#  subtitle        :string
#  startdate       :date
#  enddate         :date
#  app_deadline    :date
#  description     :text
#  hours_per_week  :integer
#  compensation    :integer
#  education_level :integer
#  state           :integer          default(1)
#  positions       :text             is an Array
#  questions       :text             is an Array
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  department      :text             is an Array
#  courses         :text             is an Array
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
