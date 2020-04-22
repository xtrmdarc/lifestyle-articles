class Category < ApplicationRecord
  has_many :article_categories, class_name: 'ArticleCategory'

  has_many :articles, through: :article_categories, source: :article

end
