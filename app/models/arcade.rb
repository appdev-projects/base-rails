# == Schema Information
#
# Table name: arcades
#
#  id             :integer          not null, primary key
#  address        :text
#  comments_count :integer          default(0)
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer          not null
#
# Indexes
#
#  index_arcades_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  owner_id  (owner_id => users.id)
#
class Arcade < ApplicationRecord
    belongs_to :owner, class_name: "User"

    has_many :games, through: :machines

    has_many :machines, dependent: :destroy

    has_many :comments, dependent: :destroy

end
