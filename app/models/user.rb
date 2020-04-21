class User < ApplicationRecord
  has_many :votes
  has_many :articles, foreign_key: :author_id
  
end
