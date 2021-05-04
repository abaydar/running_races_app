class UsersController < ApplicationController
  before_action :get_user, except: [:index, :new, :create]
  before_action :redirect_if_not_current_user, :redirect_if_not_logged_in, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    @top_user = User.most_races_run.first
  end

  def show
    if @user.user_races.present?
      @user_race = @user.user_races.last
      @race = Race.find_by_id(@user_race.race_id)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy 
    @user.destroy 
    redirect_to races_path
  end

  private
  
  def get_user
    @user = User.find_by(id: params[:id]) 
  end

  def user_params
    params.require(:user).permit(:name, :username, :age, :password, race_ids: [])
  end

  def redirect_if_not_current_user
    if @user.id != current_user.id
        redirect_to user_path(@user)
    end
  end


end
