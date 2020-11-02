class SessionsController < ApplicationController
    def new
        redirect_to current_user if logged_in?
    end 

    def create 
        if params[:user]
            @user = User.find_by(user_name: params[:user_name])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to @user
            else 
                redirect_to login_path
            end 
        else
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
            end
              session[:user_id] = @user.id
              redirect_to parks_path
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
