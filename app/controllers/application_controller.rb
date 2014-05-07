class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :require_login

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def authenticate_with_token
    token = request.headers['auth-token']
    user = Session.authenticate_with token
    render json: {}, status: :unauthorized unless user
  end

  private

  def require_login
    unless current_user
      redirect_to login_url
    end
  end
end
