class UserRacesController < ApplicationController

  def new
    @user_race = UserRace.new
  end

  def create
    user_race = UserRace.create(user_race_params)
    
    
    race = Race.find_by_id(params[:race_id])
    user = User.find_by_id(current_user)
    user.races << race
    
    binding.pry
    # if user_race.save 
      redirect_to user_path(current_user)
    # else
      # render :new
    # end
  end

  def edit
  end

  def update
  end

  private

  def user_race_params
    params.require(:user_race).permit(:finish_time, :review, :race_id)
  end
end
