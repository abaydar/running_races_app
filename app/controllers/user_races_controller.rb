class UserRacesController < ApplicationController
  before_action :redirect_if_not_logged_in, :get_race
  before_action :redirect_if_not_current_user, only: [:edit, :update, :destroy]
  before_action :get_user_race, only: [:edit, :destroy]

  def new
    @user_race = UserRace.new
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
    @user_race.update(user_race_params)
    redirect_to race_path(@race)
  end

  def destroy
    @user_race.destroy
    redirect_to races_path
  end

private

  def user_race_params
    params.require(:user_race).permit(:finish_time, :start_time, :review, :user_id, :race_id)
  end

  def redirect_if_not_current_user
    user_race = UserRace.find_by_id(params[:id])
    if user_race.user_id != current_user.id
        redirect_to user_path(current_user)
    end
  end

  def get_race
    @race = Race.find_by_id(params[:race_id])
  end

  def get_user_race
    @user_race = UserRace.find_by_id(params[:id])
  end


end
