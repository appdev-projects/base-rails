# == Schema Information
#
# Table name: practices
#
#  id            :integer          not null, primary key
#  body_mind     :string
#  description   :string
#  extemp_ritual :string
#  name          :string
#  spoken_silent :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Practice < ApplicationRecord

  has_many  :lessons, class_name: "Lesson", foreign_key: "practice_id", dependent: :nullify

end
