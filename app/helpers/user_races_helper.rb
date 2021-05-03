module UserRacesHelper

    def display_errors_for_user_race
        if @user_race.errors.any?
            content_tag(:h3, "Please note errors below:")
            content_tag(:ul) do
                @user_race.errors.full_messages.each do |m| 
                    concat content_tag(:li, m) 
                end
            end
        end
    end

    def delete_user_race(id, race_id)
        race = Race.find_by_id(race_id)
        user_race = UserRace.find_by_id(id)
        if user_race.user_id == current_user.id
            button_to "Delete Review & Remove from My Races", race_user_race_path(race, user_race), method: :delete
        end
    end

end
