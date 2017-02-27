# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  firstname              :string
#  lastname               :string
#  year                   :integer
#  major                  :text             is an Array
#  minor                  :text             is an Array
#  gpa                    :integer
#  department             :text             is an Array
#  preferedname           :string
#  courses                :text             is an Array
#  compensation           :integer
#  phone_number           :integer
#  graduation_year        :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :research_applications
  has_many :projects, through: :research_applications
  validates :gpa, numericality: { greater_than: 0, less_than_or_equal_to: 4.0 },
  format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "format should be x.x"}
end
