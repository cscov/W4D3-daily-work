class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :require_login

  helper_method :current_user, :logged_in?

  def current_user
    return nil unless session[:session_token].present?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  

  # private
  #
  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to users_url # halts request cycle
  #   end
  # end

end
