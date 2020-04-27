class Category < ApplicationRecord
  validates :name, presence: true
  validates :priority, presence: true
  has_many :article_categories, class_name: 'ArticleCategory'
  
  has_many :articles, through: :article_categories, source: :article

  def self.featured_articles
    Category.includes(:articles)
  end

  def latest_article
    articles.order(created_at: :desc).limit(1).first
  end
end
