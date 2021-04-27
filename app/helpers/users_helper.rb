module UsersHelper

    def redirect_if_not_current_user
        if @user.id != current_user.id
            redirect_to user_path(@user)
        end
    end
    

end
