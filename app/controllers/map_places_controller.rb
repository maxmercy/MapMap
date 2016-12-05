class MapPlacesController < ApplicationController

  def show
    @map_place = MapPlace.find(params[:id])
    @map = @map_place.map
    @place = @map_place.place
    @user = @map.user
  end


  def destroy
      map_place = MapPlace.find(params[:id])
      map = map_place.map
      map_place.delete
      redirect_to map
  end

  def update
      new_comment = params[:comment]
      map_place =  MapPlace.find(params[:id])
      map_place.update_attributes(comment: new_comment)
      render json: {}, statue: 202
  end



end
