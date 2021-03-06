class ArticlesController < ApplicationController
  before_action :require_login, only: %i[create new vote_for_article unvote_for_article]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    @article.author_id = current_user.id

    if params[:article][:file]
      s3_service = Aws::S3::Resource.new
      bucket_path = 'diego/' + File.basename(params[:article][:file].original_filename)

      s3_file = s3_service.bucket('ror-capstone').object(bucket_path)
      s3_file.upload_file(params[:article][:file].path, acl: 'public-read')
      @article.image = s3_file.public_url.to_s
    end
    @article.category_ids = params[:article][:category_ids]

    if @article.save
      redirect_to root_path
    else
      flash.now[:errors] = @article.errors.full_messages
      render 'new'
    end
  end

  def vote_for_article
    @article = Article.find(params[:id])
    if @article
      @article.vote(current_user.id)
      if @article.save
        redirect_to request.referer
      else
        redirect_to login_path
      end
    else
      redirect_to signup_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def unvote_for_article
    @article = Article.find(params[:id])
    if @article
      @article.unvote(current_user.id)
      if @article.save
        redirect_to request.referer
      else
        redirect_to login_path
      end
    else
      redirect_to signup_path
    end
  end

  private

  def require_login
    redirect_to login_path unless current_user
  end

  def articles_params
    params.require('article').permit(:title, :text)
  end
end
