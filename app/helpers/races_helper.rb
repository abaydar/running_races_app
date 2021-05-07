module RacesHelper
    
    def create_race
        if logged_in?
            button_to "Create a New Race", new_race_path, method: :get
        end
    end
    def find_race(id)
        Race.find_by_id(id)
    end
    
    def delete_race
        if logged_in? && @race.creator_id == current_user.id 
            button_to "Delete Race", @race, method: :delete
        end
    end

    def edit_race
        if logged_in? && @race.creator_id == current_user.id
            button_to "Edit Race", edit_race_path(@race), method: :get
        end
    end
    
    def display_last_race
        if @race
         content_tag(:h3) do 
            concat "Last Race: " 
            concat link_to @race.name, race_path(@race)
         end
        end
    end   

    def add_to_my_races
        if !current_user.user_races.include?(UserRace.find_by(race_id: params[:id]))
            button_to "Add to My Races", new_race_user_race_path(@race), method: :get
        end
    end

    def browse_all_races
      link_to "Browse all Races", races_path
    end


    # def races_with_finish_time
    #     content_tag(:ul) do 
    #         @user_races.each do |r|
    #             content_tag(:li) do 
    #                 concat link_to find_race(r.race_id).name, race_path(find_race(r.race_id)
    #                 concat "Distance: "
    #                 concat find_race(r.race_id).distance} 
    #                 concat "Finish Time: "
    #                 concat display_finish_time(r.start_time, r.finish_time)
    #             end
    #         end
    #     end
    # end 
  

end
