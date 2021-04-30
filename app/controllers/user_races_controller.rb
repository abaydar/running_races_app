class UserRacesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @user_race = UserRace.new
    @race = Race.find_by_id(params[:race_id])
  end

  def create
    @user_race = current_user.user_races.build(user_race_params)
    if @user_race.save 
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def user_race_params
    params.require(:user_race).permit(:finish_time, :start_time, :review, :user_id, :race_id)
  end
end
