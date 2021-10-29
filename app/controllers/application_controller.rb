class ApplicationController < ActionController::Base
  #makes current_user available to the views 
  helper_method :current_user, :logged_in?
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    #turn current_user into a boolean using !!
    !!current_user
  end 

  def require_user 
    if !logged_in? 
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end 

end
