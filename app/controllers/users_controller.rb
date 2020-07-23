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
        @user = User.find_by_id(params[:id])
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
        params.require(:user).permit(:name, :password, :password_confirmation, :email, :height, :weight, :uid, :provider)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end