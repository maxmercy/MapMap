class MapPlacesController < ApplicationController


  def destroy
      map = Map.find(params[:map_id])
      place_id = params[:place_id]
      linkMapPlace = MapPlace.find_by(map_id: map.id, place_id: place_id)
      linkMapPlace.delete
      redirect_to map
  end



end
