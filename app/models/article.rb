class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes

  has_many :article_categories, class_name: 'ArticleCategory'
  has_many :categories, through: :article_categories, source: :category
  has_many :users_voted, through: :votes, source: :user

  def self.most_voted_article
    Article.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').limit(1).first
  end

  def user_voted?(userid)
    users_voted.where(id: userid).first
  end

  def unvote(userid) 
    votes.where(user_id: userid).first.destroy
  end
end
