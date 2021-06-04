# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  description  :text
#  release_date :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Game < ApplicationRecord
  has_many :fans, through: :favorites

end
