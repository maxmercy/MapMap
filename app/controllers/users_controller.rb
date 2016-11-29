class UsersController < ApplicationController

  def show

    @user = current_user
    @user_maps = @user.maps
    # byebug
  end

  def index
    @users = User.all
  end

end
