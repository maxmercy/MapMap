class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: :show_public, unless: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    profil_user_path(user_id: current_user.id)
  end

end
