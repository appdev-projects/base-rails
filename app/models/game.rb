# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  description  :text
#  release_year :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Game < ApplicationRecord
end
