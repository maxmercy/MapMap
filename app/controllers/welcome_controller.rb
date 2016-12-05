class WelcomeController < ApplicationController
  after_action :verify_authorized, except: :index

  def index

  end
end
