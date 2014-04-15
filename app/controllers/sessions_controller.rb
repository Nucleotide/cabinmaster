class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
    unless current_user.nil?
      redirect_to cabins_path
    end
  end

  def create
    user = User.find_by name: params[:name]

    if user.nil? or not user.authenticate params[:password]
      redirect_to :back, notice: "username and password do not match"
    else
      session[:user_id] = user.id
      redirect_to cabins_path, notice: "Welcome back!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to cabins_path, notice: "Logged out!"
  end
end