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
    map = Map.create(name: city, city: city, user_id: current_user.id)
    redirect_to map_path(map)
  end

  def update
    if params[:map_name].present?
      new_name = params[:map_name]
      map =  Map.find(params[:id])
      map.update_attributes(name: new_name )
      redirect_to map
    elsif params[:place_id_to_remove].present?
      place_id = params[:place_id_to_remove]
      place = Place.find(place_id)
      map =  Map.find(params[:id])
      map.places.delete(place)
      redirect_to map
    end

  end

  def destroy
    map = Map.find(params[:id])
    map.destroy
    redirect_to profil_user_path(current_user)
  end

end
