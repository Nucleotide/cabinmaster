class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
    unless current_user.nil?
      redirect_to cabins_path
    end

  end

  def createRemoteSession

    user = User.find_by user:params[:name]
    auth = user.authenticate(params[:password]) if user

    @session = Session.new(user:user)

    if auth and @session.save
      render json: @session.token
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end


  def destroyRemoteSession
    token = request.headers['auth-token']
    s = Session.with token
    s.delete
    head :no_content
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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
    params.require(:session).permit(:token, :user_id)
  end
end