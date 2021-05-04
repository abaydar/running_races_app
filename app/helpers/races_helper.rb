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
        if @race.creator_id == current_user.id
            button_to "Delete Race", @race, method: :delete
        end
    end

    def edit_race
        if @race.creator_id == current_user.id
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

    
    # def display_errors_for_race
    #     if @race.errors.any?
    #         content_tag(:h3, "Please note errors below:")
    #         content_tag(:ul) do
    #             @race.errors.full_messages.each do |m| 
    #                 concat content_tag(:li, m) 
    #             end
    #         end
    #     end
    # end


    # def display_all_races
    #     content_tag(:ul) do
    #         @races.each do |r|
    #             yield
    #             concat content_tag(:li, "#{link_to r.name, race_path(r)} - #{r.location} - #{r.distance}")
    #         end
    #     end 
    # end

    
    # def races_with_finish_time
    #     content_tag(:ul) do 
    #         @user_races.each do |r|
    #             concat content_tag(:li, "#{link_to find_race(r.race_id).name, race_path(find_race(r.race_id))} 
    #             Distance: #{find_race(r.race_id).distance} 
    #             Finish Time: #{display_finish_time(r.start_time, r.finish_time)}")
    #         end
    #     end
    # end 
  

end
