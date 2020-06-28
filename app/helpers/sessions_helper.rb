module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permament.encrypted[:user_id] = user.id
    cookies.permement[:remember_token] = user.remember_token
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
        
    end
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil 
  end
end
