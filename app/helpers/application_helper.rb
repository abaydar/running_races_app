module ApplicationHelper

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def logout_or_login
        if logged_in?
            button_to 'Logout', logout_path
        else
            button_to 'Login', login_path, method: :get 
        end
    end

end
