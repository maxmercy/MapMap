class MapPolicy < ApplicationPolicy
# after_action :verify_authorized, except: :index

  def edit?
    user == record.user
  end


  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end

  def duplicate?
    user
  end

  def map_share?
    user == record.user
  end

  def save_public?
    true
  end

end
