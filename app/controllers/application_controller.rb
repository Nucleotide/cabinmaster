class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  helper_method :current_user

  before_filter :require_login

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def authenticate_with_token
    token = request.headers['auth-token']
    Session.authenticate_with token
  end

  private

  def require_login
    if current_user.nil? and authenticate_with_token.nil?
      redirect_to login_url
    end
  end
end
