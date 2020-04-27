class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :votes
  has_many :articles, foreign_key: :author_id
end
