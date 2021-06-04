# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  description     :text
#  favorites_count :integer          default(0)
#  release_date    :string
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Game < ApplicationRecord
  has_many :fans, through: :favorites

  has_many :machines, dependent: :destroy

  has_many :arcades, through: :machines
end
