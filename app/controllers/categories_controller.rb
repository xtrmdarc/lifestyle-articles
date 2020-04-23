class CategoriesController < ApplicationController
  def index
    @mva = Article.most_voted_article
    @categories = Category.all.order(:priority)
  end

  def show
    @category = Category.find(params[:id])
  end
end
