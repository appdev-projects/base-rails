# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  comments_count         :integer          default(0)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  favorites_count        :integer          default(0)
#  name                   :string
#  private                :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, foreign_key: :author_id, dependent: :destroy

  has_many :favorites, foreign_key: :fan_id, dependent: :destroy

  has_many :own_arcades, foreign_key: :owner_id, class_name: "Arcade", dependent: :destroy

  has_many :favorited_games, through: :favorites, source: :game

end
