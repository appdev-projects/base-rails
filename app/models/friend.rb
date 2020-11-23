# == Schema Information
#
# Table name: friends
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class Friend < ApplicationRecord
  validates(:sender_id, { :presence => true })
  validates(:recipient_id, { :presence => true })

  belongs_to(:sender_user, { :required => false, :class_name => "User", :foreign_key => "sender_user_id" })

end
