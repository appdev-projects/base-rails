# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  arcade_id  :integer          not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_comments_on_arcade_id  (arcade_id)
#  index_comments_on_author_id  (author_id)
#
# Foreign Keys
#
#  arcade_id  (arcade_id => arcades.id)
#  author_id  (author_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", counter_cache: true
  belongs_to :arcade, counter_cache: true

  validates :body, presence: true
end
