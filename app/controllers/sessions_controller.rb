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
            render:new
        end
    end

    def destroy
        session.delete :user_id 
        redirect_to login_path
    end

    def omniauth       
            user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|  
                u.username = request.env['omniauth.auth'][:info][:email]
                u.name = request.env['omniauth.auth'][:info][:name]
                u.password = SecureRandom.hex(15)
            end
        
        if user.valid?
            session[:user_id] = user.id
            redirect_to races_path
        else
            redirect_to login_path
        end
    end

end