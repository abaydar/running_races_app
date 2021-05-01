class ApplicationController < ActionController::Base
    include ApplicationHelper

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to login_path
        end
    end


end
