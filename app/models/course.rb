# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  concentration  :string
#  group_size_max :string
#  group_size_min :string
#  group_work     :string
#  name           :string
#  section        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Course < ApplicationRecord
  has_many(:likes, { :class_name => "Like", :foreign_key => "course_id", :dependent => :destroy })

  has_many(:users, { :through => :likes, :source => :user })
end
