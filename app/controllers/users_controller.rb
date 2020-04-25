class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login_user(@user.id)
      redirect_to categories_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path 
    end
  end

  private

  def user_params
    params.require('user').permit(:name,:username)
  end
end
