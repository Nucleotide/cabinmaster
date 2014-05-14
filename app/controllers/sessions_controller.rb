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
      redirect_to :back, notice: "Tarkista syöttämästi tiedot"
    else
      session[:user_id] = user.id
      redirect_to cabins_path, notice: "Kirjautuminen onnistui!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to cabins_path, notice: "Olet kirjautunut ulos!"
  end
end