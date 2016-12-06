class ApplicationController < ActionController::Base

  include Pundit
  after_action :verify_authorized, except: :show_public, unless: :devise_controller?
  protect_from_forgery with: :exception


  # saves the location before loading each page so we can return to the
  # right page. If we're on a devise page, we don't want to store that as the
  # place to return to (for example, we don't want to return to the sign in page
  # after signing in), which is what the :unless prevents
  before_filter :store_current_location, :unless => :devise_controller?





    def after_sign_in_path_for(resource)
      return stored_location_for(:user) || root_path

      # profil_user_path(user_id: current_user.id)
    end




  private
    # override the devise helper to store the current location so we can
    # redirect to it after loggin in or out. This override makes signing in
    # and signing up work automatically.
    def store_current_location
      store_location_for(:user, request.url)
    end





end
