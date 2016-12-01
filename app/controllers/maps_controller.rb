class MapsController < ApplicationController
  def new
    @map = Map.new
  end

  def show
    @map = Map.find(params[:id])
    @creator = @map.user
  end

  def create
    city = params[:city]
    map = Map.create(name: city, user_id: current_user.id)
    redirect_to map_path(map)
  end
end
