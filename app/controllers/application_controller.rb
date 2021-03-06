class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def current_user 
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end 
    end 

    def logged_in?
        !!current_user
    end 

    def require_login
        redirect_to '/login' if !logged_in?
    end 
    helper_method :current_user
    helper_method :logged_in?
end
