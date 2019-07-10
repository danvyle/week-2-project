class AuthController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:auth][:username])
    if user && user.authenticate(params[:auth][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private
  def session_params
    params.require(:auth).permit(:username, :password)
  end
end
