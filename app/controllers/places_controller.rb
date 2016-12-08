class PlacesController < ApplicationController

  def create
    map = Map.find(params[:map_id])

    new_place = Place.new
    new_place.title =  params[:title]
    new_place.longitude = params[:longitude]
    new_place.latitude = params[:latitude]
    new_place.rating = params[:rating]
    new_place.address = params[:address]
    new_place.phone_number = params[:phone]
    new_place.gmap_url = params[:url_gmap]
    authorize new_place

    new_place.save
    map.places.push(new_place)

    map_place = MapPlace.where(map_id: map.id).find_by(place_id: new_place.id)
    html = render_to_string partial: 'maps/listplacemap', locals: {map_place: map_place}, layout: false
    render json:  { html_to_append: html, map_place_id: map_place.id }
  end



end
