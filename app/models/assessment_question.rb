# == Schema Information
#
# Table name: assessment_questions
#
#  id             :integer          not null, primary key
#  assessment     :string
#  name           :string
#  number         :string
#  question       :string
#  spiritual_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class AssessmentQuestion < ApplicationRecord
end
