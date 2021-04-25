class SessionsController < ApplicationController
    
    def new
        if logged_in?
            redirect_to user_path(current_user.id)
        end
    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            #display error messages
            render:new
        end
    end

    def destroy
        session.delete :user_id 
        redirect_to login_path
    end

    def omniauth
    end

end