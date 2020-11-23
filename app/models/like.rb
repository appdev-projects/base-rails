# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  user_id    :integer
#
class Like < ApplicationRecord
  validates(:course_id, { :presence => true })
  validates(:user_id, { :presence => true })
  
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:course, { :required => false, :class_name => "Course", :foreign_key => "course_id" })
end
