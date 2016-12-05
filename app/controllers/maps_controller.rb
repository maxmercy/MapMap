class MapsController < ApplicationController
  def new
    @map = Map.new
  end

  def show
    @map = Map.find(params[:id])
    @creator = @map.user
  end

  def edit
    @map = Map.find(params[:id])
    @creator = @map.user
  end



  def create
    city = params[:city]
    map = Map.create(name: city, city: city, user_id: current_user.id)
    redirect_to edit_map_path(map)
  end

  def update
    if params[:map_name].present?
      new_name = params[:map_name]
      map =  Map.find(params[:id])
      map.update_attributes(name: new_name )
      redirect_to edit_map_path
    end
  end

  def duplicate
    @map_origin = Map.find(params[:id])
    @map_duplicate_name = @map_origin.name + "-copy-" + Time.now.to_formatted_s(:number)
    current_user_id =  current_user.id
    @map_duplicate = Map.new(name: @map_duplicate_name,
                            city: @map_origin.city,
                            user_id: current_user_id ,
                            longitude: @map_origin.longitude,
                            latitude: @map_origin.latitude
                            )
    @map_duplicate.save
    @map_duplicate.duplicate(@map_origin)
    redirect_to edit_map_path(@map_duplicate)
  end

  def destroy
    map = Map.find(params[:id])
    map.destroy
    redirect_to profil_user_path(current_user)
  end



end
