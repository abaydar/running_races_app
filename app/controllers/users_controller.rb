class UsersController < ApplicationController
  include ApplicationHelper
  before_action :get_user, except: [:index, :new, :create]
  before_action :redirect_if_not_logged_in, except: [:index, :show]
  before_action :redirect_if_not_current_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    #link_to show page
  end

  def show
    if @user.user_races.present?
      @user_race = @user.user_races.last
      @races = Race.find_by_id(@user_race.race_id)
    end
    #show profile with all races (link_to races show page) and link to user_race show page (with comments)
    #display finish time, rating, review
  end

  def new
    @user = User.new
    #render /signup form
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      #display error messages
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      #display error messages 
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
