# == Schema Information
#
# Table name: machines
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  arcade_id  :integer          not null
#  game_id    :integer          not null
#
# Indexes
#
#  index_machines_on_arcade_id  (arcade_id)
#  index_machines_on_game_id    (game_id)
#
# Foreign Keys
#
#  arcade_id  (arcade_id => arcades.id)
#  game_id    (game_id => games.id)
#
class Machine < ApplicationRecord
  belongs_to :arcade, counter_cache: true
  belongs_to :game, counter_cache: true

  validates :arcade_id, uniqueness: { scope: :game_id, message: "has already registered this game" }
end
