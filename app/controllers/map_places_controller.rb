class MapPlacesController < ApplicationController

  def show
    @map_place = MapPlace.find_by(map_id: params[:map_id], place_id: params[:place_id])
    @map = @map_place.map
    @place = @map_place.place
    @user = @map.user
  end


  def destroy
      map = Map.find(params[:map_id])
      place_id = params[:place_id]
      linkMapPlace = MapPlace.find_by(map_id: map.id, place_id: place_id)
      linkMapPlace.delete
      redirect_to map
  end

  def update
    if params[:comment].present?
      new_comment = params[:comment]
      map_place =  MapPlace.find(params[:id])
      map_place.update_attributes(comment: new_comment)
      render json: {}, statue: 202
    end

  end



end
