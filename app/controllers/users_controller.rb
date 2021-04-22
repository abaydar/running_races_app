class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    #show profile with all races (link_to races show page) and link to user_race show page (with comments)
    #display finish time, rating, review
  end

  def new
    #render signup form
  end

  def create
    #process signup form
  end

  def edit
    #edit user profile, edit user form
  end

  def update
    #process edit user form
  end

  def destroy 
    #delete user profile
  end

  private
  
  def get_user 
  end

end
