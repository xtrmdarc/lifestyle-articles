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

  def vote_for_article
    @article = Article.find(params[:id])
    if @article
      @vote = @article.votes.build
      @vote.user_id = current_user.id
      @article.vote_count = @article.vote_count + 1
      if @vote.save && @article.save
        redirect_to category_path(params[:cat_id])
      else 
        render 'new'
      end
    else 
      render 'new'
    end
  end

  def unvote_for_article
    @article = Article.find(params[:id])
    if @article
      @article.unvote(current_user.id)
      @article.vote_count = @article.vote_count - 1
      if @article.save
        redirect_to category_path(params[:cat_id])
      else 
        render 'new'
      end
    else 
      render 'new'
    end
  end
end
