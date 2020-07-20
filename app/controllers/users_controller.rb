class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render new_user_path
        end
    end

    def show
        if !logged_in?
            redirect_to root_path
        end
    end

    def edit
        if user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render new_user_path
        end
    end

    def update

    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end