module SessionsHelper
  def login_user(user_id)
    session[:user_id] = user_id
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def logout_user
    session.delete(:user_id)
    @current_user = nil
  end
end
