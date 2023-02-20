class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authorized
  helper_method :logged_in?
  helper_method :is_admin?

  #method to identify current user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end
  #method to identify if current user is logged in or not
  def logged_in?
    !current_user.nil?
  end
  #method to identify if current user is logged in to be authoried to access URLs
  def authorized
    redirect_to root_path unless logged_in?
  end
  #method to check if current user is admin
  def is_admin?
    current_user[is_admin]
  end

end
