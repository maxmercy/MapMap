class MapsController < ApplicationController


  def new
    @map = Map.new
  end

  def show

    @map = Map.find(params[:id])
    @creator = User.find(@map.user_id)

  end


  def create

      

      city = params[:city]
      geocord_city = Geocoder.search(city).first
      coord_city = geocord_city.coordinates
      lat_city = coord_city[0]
      long_city = coord_city[1]
      map = Map.create(name: city,
                        longitude: long_city,
                        latitude: lat_city,
                        user_id: params[:creator_id].to_i
                        )
      map.save

      redirect_to map_path(map.id)

  end


end
