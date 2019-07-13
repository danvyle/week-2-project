class AuthController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:auth][:username])
    if user && user.authenticate(params[:auth][:password])
      session[:user_id] = user.id
      log_in(user)
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
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
