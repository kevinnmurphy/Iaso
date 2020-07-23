class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def omniauth  #login with omniauth
        # byebug
        user = User.from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to login_path
        end
    end
    
    def create #log in manually
        user = User.find_by_name(params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path, alert: "Wrong username or password."
        end
    end

    #     def create
    #     # After entering a name and email value in the /auth/developer
    #     # path and submitting the form, you will see a pretty-print of
    #     # the authentication data object that comes from the "developer"
    #     # strategy. In production, we'll swap this strategy for something
    #     # like 'github' or 'facebook' or some other authentication broker
    #     pp request.env['omniauth.auth']
    
    #     # We're going to save the authentication information in the session
    #     # for demonstration purposes. We want to keep this data somewhere so that,
    #     # after redirect, we have access to the returned data
    #     session[:name] = request.env['omniauth.auth']['info']['name']
    #     session[:omniauth_data] = request.env['omniauth.auth']
    
    #     # Ye olde redirect
    #     redirect_to root_path
    # end
    
    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end