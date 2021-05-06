module UsersHelper

    def home_page
        if logged_in?
            button_to "Home Page", user_path(current_user), method: :get 
        end
    end

    def delete_user
        if logged_in? && @user == current_user
            button_to 'Delete User', @user ,method: :delete, data: {confirm: "Are you sure?"}
        end
    end



    # def display_errors_for_user
    #     if @user.errors.any?
    #         content_tag(:h3, "Please note errors below:")
    #         content_tag(:ul) do
    #             @user.errors.full_messages.each do |m| 
    #                 concat content_tag(:li, m) 
    #             end
    #         end
    #     end
    # end



end
