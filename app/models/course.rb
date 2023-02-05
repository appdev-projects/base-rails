# == Schema Information
#
# Table name: courses
#
#  id                :integer          not null, primary key
#  lessons_count     :integer
#  short_description :string
#  spiritual_type    :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Course < ApplicationRecord
end
