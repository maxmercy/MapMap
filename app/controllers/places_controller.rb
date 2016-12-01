class PlacesController < ApplicationController

  def create
    @map = Map.find(params[:map_id])
    place = Place.new
    place.title =  params[:title]
    place.longitude = params[:longitude]
    place.latitude = params[:latitude]
    place.rating = params[:rating]
    place.address = params[:address]
    place.phone_number = params[:phone]
    place.gmap_url = params[:usr_gmap]

    place.save
    @place = place

    @map.places.push(place)
    respond_to do |format|
    # format.json { render json: attr_reader :attr_names}
    format.js {render layout: false}
    end
  end
def index
end
end
