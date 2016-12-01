class UsersController < ApplicationController

  def show
    @user = current_user
    @user_maps = @user.maps
  end

  def index
    @users = User.all
  end
end
