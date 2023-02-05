# == Schema Information
#
# Table name: seekers
#
#  id                     :integer          not null, primary key
#  communal_score         :float            default(0.0)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  environmental_score    :float            default(0.0)
#  full_name              :string
#  personal_score         :float            default(0.0)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  spiritual_type         :string
#  transcendental_score   :float            default(0.0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  active_course_id       :integer          default(0)
#
# Indexes
#
#  index_seekers_on_email                 (email) UNIQUE
#  index_seekers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Seeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :lesson_events, class_name: "LessonEvent", foreign_key: "seeker_id", dependent: :destroy

  belongs_to :course, class_name: "Course", foreign_key: "active_course_id"

  
end
