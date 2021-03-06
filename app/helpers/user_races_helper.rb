module UserRacesHelper
    
    def display_finish_time(start_time, finish_time)
        t = finish_time - start_time
        Time.at(t).utc.strftime("%H:%M:%S")
    end
    
    def delete_user_race(id, race_id)
        if logged_in?
            race = Race.find_by_id(race_id)
            user_race = UserRace.find_by_id(id)
            if user_race.user_id == current_user.id
                button_to "Remove from My Races", race_user_race_path(race, user_race), method: :delete, data: {confirm: "Are you sure?"}
            end
        end
    end

    def edit_user_race(id, race_id)
        if logged_in?
            race = Race.find_by_id(race_id)
            user_race = UserRace.find_by_id(id)
            if user_race.user_id == current_user.id
                link_to "Edit", edit_race_user_race_path(race, user_race)
            end
        end
    end
    
end
