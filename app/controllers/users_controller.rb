class UsersController < ApplicationController

    def new 
        redirect_to current_user if logged_in?
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end 
    end 
    
    def show
        require_login
        set_user
    end 

    def edit
        set_user
         if current_user != set_user
            redirect_to current_user
         end 
    end 

    def update
        @user = User.find_by_id(params[:id])
        @user.update(user_params)
        redirect_to current_user, notice: 'Profile was successfully updated.'
    end 
    
    private

    def set_user
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:full_name, :user_name,:email, :password, :password_confirmation )
    end 

end
