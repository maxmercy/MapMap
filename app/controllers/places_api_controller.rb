class PlacesApiController < ApplicationController
  def create
    map = Map.find(params[:map_id])

    place = Place.new
    place.title =  params[:title]
    place.longitude = params[:longitude]
    place.latitude = params[:latitude]
    place.rating = params[:rating]
    place.address = params[:address]
    place.phone_number = params[:phone]
    place.gmap_url = params[:usr_gmap]

    place.save

    map.places.push(place)

		render json: place
	end
end
