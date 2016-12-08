class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordInvalid, :with => :show_errors
  rescue_from ActiveRecord::RecordNotFound, :with =>  :show_errors


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



protected

  def show_errors(exception)
    flash[:warning] = "I didn't found what you are looking for."
    redirect_to(request.referrer || root_path)
      # exception.record.new_record? ? ...
  end

  def user_not_authorized
   flash[:danger] = "You are not authorized to perform this action."
   redirect_to(request.referrer || root_path)
 end




  private
    # override the devise helper to store the current location so we can
    # redirect to it after loggin in or out. This override makes signing in
    # and signing up work automatically.
    def store_current_location
      store_location_for(:user, request.url)
    end





end
