# == Schema Information
#
# Table name: lessons
#
#  id            :integer          not null, primary key
#  audio_link    :string
#  day           :integer          default(0)
#  description   :string
#  teaching_link :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :integer
#  practice_id   :integer
#
class Lesson < ApplicationRecord

  belongs_to :course, required: true, class_name: "Course", foreign_key: "course_id", counter_cache: true
  belongs_to :practice, required: true, class_name: "Practice", foreign_key: "practice_id"


end
