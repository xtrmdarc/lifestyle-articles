class CategoriesController < ApplicationController
  def index
    @most_voted_article = Article.most_voted_article
    @categories = Category.all
  end
end
