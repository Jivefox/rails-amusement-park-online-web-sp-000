class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :require_login

  def current_user
    User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to '/' unless logged_in?
  end

end
