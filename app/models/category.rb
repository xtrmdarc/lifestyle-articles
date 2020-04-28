class Category < ApplicationRecord
  validates :name, presence: true
  validates :priority, presence: true
  has_many :article_categories, class_name: 'ArticleCategory'

  has_many :articles, through: :article_categories, source: :article
  has_many :latest_articles, -> { order(created_at: :desc) }, through: :article_categories, source: :article

  def self.featured_articles
    Category.includes(:articles)
  end
end
