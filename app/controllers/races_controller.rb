class RacesController < ApplicationController
  #before action get_race except index, new, create

  def index
    @races = Race.all
  end
  
  def show
    @race = Race.find_by_id(params[:id])
    #show race details, button to add race to "profile" 
  end

  def new
    #redirect_if_not_logged_in
    @race = Race.new
  end

  def create
    #redirect_if_not_logged_in
    @race = Race.new(race_params)
    if @race.save
      @race.creator_id = current_user.id
      current_user.races << @race 
      redirect_to user_path(current_user.id)
    else
      #display errors
      render :new
    end
  end
  
  def edit
    #redirect_if_not_current_user
  end

  def update
    #redirect_if_not_current_user
  end

  def destroy
    #redirect_if_not_current_user
  end

  private

  def race_params
    params.require(:race).permit(:name, :distance, :location, :date, :age_group, :creator_id)
  end

  def get_race
    @race = Race.find_by_id(params[:id])
  end
  

end
