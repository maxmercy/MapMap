class MapPlacesController < ApplicationController

  def edit
    @map_place = MapPlace.find(params[:id])
    authorize @map_place
    @map = @map_place.map
    @place = @map_place.place
    @user = @map.user
  end


  def destroy
      map_place = MapPlace.find(params[:id])
      authorize map_place
      map = map_place.map
      map_place.delete
      flash[:success] = "the place have been remove from your map."
      redirect_to edit_map_path(map)
  end

  def update
      new_comment = params[:comment]
      map_place =  MapPlace.find(params[:id])
      authorize map_place
      map_place.update_attributes(comment: new_comment)
      flash[:success] = "comment updated!"
      render json: {}, statue: 202
  end

end
