class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
  end
  #Create New Session and assign user
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "username or password is invalid"
      render "new"
    end
  end

  #End Current Session
  def destroy
    session[:user_id] = nil
    session.delete(:user_id)
    redirect_to root_url, notice: "Logged out!"
  end
end
