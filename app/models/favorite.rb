# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer          not null
#  game_id    :integer          not null
#
# Indexes
#
#  index_favorites_on_fan_id   (fan_id)
#  index_favorites_on_game_id  (game_id)
#
# Foreign Keys
#
#  fan_id   (fan_id => users.id)
#  game_id  (game_id => games.id)
#
class Favorite < ApplicationRecord
  belongs_to :fan, class_name: "User", counter_cache: true
  belongs_to :game, counter_cache: true

  validates :fan_id, uniqueness: { scope: :game_id, message: "has already favorited this game" }
end
