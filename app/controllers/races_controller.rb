class RacesController < ApplicationController
  def index
    @races = Race.all
  end
  
  def show
    @race = Race.find_by_id(params[:id])
    #show race details, button to add race to "profile" 
  end

end
