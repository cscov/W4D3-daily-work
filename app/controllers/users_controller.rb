class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:session_token] = @user.session_token
      flash[:success] = "Successfully created your account!"
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to new_session_url
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
