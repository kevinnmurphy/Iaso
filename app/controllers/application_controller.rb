class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?, :require_login
  
    def logged_in?
      current_user
    end
  
    def current_user
      @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  
    def require_login
      if !logged_in?
        redirect_to root_path
      end
    end
end