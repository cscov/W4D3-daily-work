class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if user
      session[:session_token] = user.session_token
      flash[:success] = "Successfully logged in!"
      redirect_to cats_url
    else
      flash.now[:errors] = "Bad auth credentials"
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      flash[:success] = "Successfully logged out."
      redirect_to new_session_url
    else
      redirect_to users_url
    end
  end
end
