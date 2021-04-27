module RacesHelper

    def redirect_if_not_authorized
        if @race.creator_id != current_user.id 
            redirect_to races_path
        end
    end

end
