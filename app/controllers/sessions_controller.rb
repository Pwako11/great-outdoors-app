class SessionsController < ApplicationController
    def new
        redirect_to current_user if logged_in?
    end 

    def create 
        byebug
        if auth_hash = request.env["omniauth.auth"]
            oauth_email = request.env["omniauth.auth"]["info"]["email"]
            oauth_name = request.env["omniauth.auth"]["info"]["name"]
           if user = User.find_by(:email  => oauth_email)
                session[:user_id] = user.id
                redirect_to user_path(user.id)
           else 
                user = User.new(:email => oauth_email, :full_name => oauth_name, :password_digest => SecureRandom.hex )
                
                if user.save
                    session[:user_id] = user.id
                    redirect_to user_path(user.id)
                end 
            end  
        end 

        if params[:email]
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to @user
            else 
                redirect_to login_path
            end 
        end 
    end 

    def destroy
        session.delete(:user_id)
        redirect_to login_path, notice: "You are signed out"
    end 

    private
 
    def auth
        request.env['omniauth.auth']
    end

end
