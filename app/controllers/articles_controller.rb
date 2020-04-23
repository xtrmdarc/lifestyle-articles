class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(author_id: current_user.id, title: params[:article][:title], text: params[:article][:text])
    @article.category_ids = params[:article][:category_ids]
    if @article.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
  end
  
end
