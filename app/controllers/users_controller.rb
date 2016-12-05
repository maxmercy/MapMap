class UsersController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    authorize @user
    @user_maps = @user.maps
  end

  def index
    @users = User.all
  end
end
