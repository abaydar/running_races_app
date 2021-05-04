module UserRacesHelper

    
    def display_finish_time(start_time, finish_time)
        t = finish_time - start_time
        Time.at(t).utc.strftime("%H:%M:%S")
    end
    
    def delete_user_race(id, race_id)
        race = Race.find_by_id(race_id)
        user_race = UserRace.find_by_id(id)
        if user_race.user_id == current_user.id
            button_to "Remove from My Races", race_user_race_path(race, user_race), method: :delete
        end
    end

    def edit_user_race(id, race_id)
        race = Race.find_by_id(race_id)
        user_race = UserRace.find_by_id(id)
        if user_race.user_id == current_user.id
            link_to "Edit", edit_race_user_race_path(race, user_race)
        end
    end
    
    # def display_errors_for_user_race
    #     if @user_race.errors.any?
    #         content_tag(:h3, "Please note errors below:")
    #         content_tag(:ul) do
    #             @user_race.errors.full_messages.each do |m| 
    #                 concat content_tag(:li, m) 
    #             end
    #         end
    #     end
    # end
end
