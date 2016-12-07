class MapsController < ApplicationController
  skip_after_action :verify_authorized, only: :save_public

  def new
    @map = Map.new
  end

  def show_public
    @map = Map.find_by(public_id: params[:public_id])
  end

  def edit
    if Map.exists?(id: params[:id])
      @map = Map.find(params[:id])
      @creator = @map.user
      authorize @map
    else
      flash[:notice] = "The URL you were looking for could not be found."
      redirect_to root_path
    end
  end

  def create
    city = params[:city]
    map = Map.create(name: city, city: city, user_id: current_user.id)
    redirect_to edit_map_path(map)
  end

  def update
      @map =  Map.find(params[:id])
      authorize @map
      if params[:map_name].present?
        new_name = params[:map_name]
      @map.update_attributes(name: new_name )
      redirect_to edit_map_path
    else
      redirect_to edit_map_path
    end

  end

  def duplicate
    @map_origin = Map.find(params[:id])
    authorize @map_origin
    @map_duplicate_name = @map_origin.name + "-copy-" + Time.now.to_formatted_s(:number)
    current_user_id =  current_user.id
    @map_duplicate = Map.new(name: @map_duplicate_name,
                            city: @map_origin.city,
                            user_id: current_user_id ,
                            longitude: @map_origin.longitude,
                            latitude: @map_origin.latitude
                            )

    @map_duplicate.save
    @map_duplicate.duplicate_map_places(@map_origin)
    redirect_to edit_map_path(@map_duplicate)
  end

  def save_public
    @map_origin = Map.find_by(public_id: params[:public_id])
    authorize @map_origin
    if user_signed_in?
      @map_duplicate_name = @map_origin.name + "-copy-" + Time.now.to_formatted_s(:number)
      current_user_id =  current_user.id
      @map_duplicate = Map.new(name: @map_duplicate_name,
                              city: @map_origin.city,
                              user_id: current_user_id ,
                              longitude: @map_origin.longitude,
                              latitude: @map_origin.latitude
                              )

      @map_duplicate.save
      @map_duplicate.duplicate_map_places(@map_origin)
      redirect_to edit_map_path(@map_duplicate)
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    map = Map.find(params[:id])
    authorize map
    map.destroy
    redirect_to profil_user_path(current_user)
  end

  def map_share
    info_email = params
    map = Map.find(params[:id])
    authorize map
    SharingMapMailer.share_a_map(info_email).deliver_now
  end

end
