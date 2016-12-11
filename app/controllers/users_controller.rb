class UsersController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    authorize @user
    @user_maps = @user.maps
    @user_show_page = true
  end

  def index
    @users = User.all
  end
end
