# == Schema Information
#
# Table name: questions
#
#  id                     :integer          not null, primary key
#  project_application_id :integer
#  title                  :string
#  answer                 :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :research_application
end
