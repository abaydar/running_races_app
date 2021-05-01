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

    def display_finish_time(start_time, finish_time)
        t = finish_time - start_time
        Time.at(t).utc.strftime("%H:%M:%S")
    end

    def create_race
        if logged_in?
            button_to "Create a New Race", new_race_path, method: :get
        end
    end

    def home_page
        if logged_in?
            button_to "Home Page", user_path(current_user), method: :get 
        end
    end



end
