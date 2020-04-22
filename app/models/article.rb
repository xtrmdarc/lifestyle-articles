class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes
  
  def self.most_voted_article
    Article.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').limit(1).first
  end
end
