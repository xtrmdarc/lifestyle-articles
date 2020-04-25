class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :author, class_name: 'User'
  has_many :votes

  has_many :article_categories, class_name: 'ArticleCategory'
  has_many :categories, through: :article_categories, source: :category
  has_many :users_voted, through: :votes, source: :user

  def self.most_voted_article
    Article.order(vote_count: :desc).first
  end

  def user_voted?(userid)
    users_voted.where(id: userid).first
  end

  def unvote(userid) 
    votes.where(user_id: userid).first.destroy
  end

  def truncate_text
    text.length >= 200 ? text[0..200] +' ...' : text + ' ...'
  end
end
