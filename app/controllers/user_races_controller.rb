class UserRacesController < ApplicationController

  def new
    @user_race = UserRace.new
  end

  def create

    binding.pry
    @user_race = UserRace.create(user_race_params)
    # if @user_race.save 
       race = Race.find_by_id(params[:race_id])
       user = User.find_by_id(current_user)
       user.races << race
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
    params.require(:user_race).permit(:finish_time, :review, :user_id)
  end
end
