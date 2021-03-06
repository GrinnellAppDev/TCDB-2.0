module SessionsHelper

  def log_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def tcc?
    current_user.rank == "TCC"
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  # We need this to determine whethere or not a user is logged in.
  def logged_in?
    !current_user.nil?
  end

  def log_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def current_user?(user)
    user == current_user
  end

  def log_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def logged_in_user
    unless logged_in?
      store_location
      redirect_to login_url, notice: "Please sign in." 
    end
  end

end
