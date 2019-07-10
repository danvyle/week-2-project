module SessionsHelper

  def redirect_user
    if !logged_in?
      redirect_to login_path
    end

  end

  def log_in(user)
     session[:user_id] = user.id
   end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
   !current_user.nil?
  end

end
