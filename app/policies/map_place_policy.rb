class MapPlacePolicy < ApplicationPolicy

  def create?
    true
  end

  def edit?
    map = Map.find(record.map_id)
    user == map.user
  end

  def destroy?
    map = Map.find(record.map_id)
    user == map.user
  end

  def update?
    map = Map.find(record.map_id)
    user == map.user
  end

end
