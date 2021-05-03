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

end
