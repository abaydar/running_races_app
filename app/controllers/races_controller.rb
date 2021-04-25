class RacesController < ApplicationController
  def index
    @races = Race.all
  end
  
  def show
    @race = Race.find_by_id(params[:id])
    #show race details, button to add race to "profile" 
  end

  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      @race.creator_id = current_user.id
      current_user.races << @race 
      redirect_to user_path(current_user)
    else
      #display errors
      render :new
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  private

  def race_params
    params.require(:user).permit(:name, :distance, :location, :date, :age_group, :creator_id)
  end

  def get_race
    @race = Race.find_by_id(params[:id])
  end
  

end
