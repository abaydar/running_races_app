class RacesController < ApplicationController
  before_action :get_race, except: [:index, :new, :create]
  before_action :redirect_if_not_logged_in, except: [:index, :show]
  before_action :redirect_if_not_authorized, except: [:index, :show, :new, :create]

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
     @user_races = @user.user_races
    else
      @races = Race.search(params[:query])
      @top_race = Race.most_popular_race.first 
    end
  end
  
  def show
  end

  def new
    @race = current_user.races.build
    @user_races = @race.user_races.build
  end

  def create
    @race = current_user.races.build(race_params)
    if @race.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @race.update(race_params)
      redirect_to race_path(@race)
    else
      render :edit
    end
  end

  def destroy
    @race.destroy
    @race.user_races.destroy_all 
    redirect_to races_path
  end

  private

  def race_params
    params.require(:race).permit(:name, :distance, :location, :date, :age_group, :creator_id, user_races_attributes: [:start_time, :finish_time, :review, :user_id])
  end

  def get_race
    @race = Race.find_by_id(params[:id])
  end

  def redirect_if_not_authorized
    if @race.creator_id != current_user.id 
        redirect_to races_path
    end
  end

end
