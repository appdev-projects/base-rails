# == Schema Information
#
# Table name: lesson_events
#
#  id         :integer          not null, primary key
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :integer
#  seeker_id  :integer
#
class LessonEvent < ApplicationRecord

  enum :status, [ :not_started, :teaching_done, :pratice_done, :complete ]

end
