require 'test_helper'

class MapTest < ActiveSupport::TestCase

   test "should not save a map without name" do
     map = Map.new
     assert_not map.save, "Saved the Map without a name"
   end

   test "if the city does not exist, it will not be valid" do
     map = Map.new(name: "name", city: "zzzzzzzzzzzzzzzz", user_id: 1)
     assert_not map.save, "Can not create a map with unvalide city-name"
   end

   test "before validation, geoocorxdinate should be set" do
     map = Map.new(name: "london", city: "london", user_id: 1)
     map.valid?
     assert_not_nil map.longitude
     assert_not_nil map.latitude
   end

  #  test "Add a map should increase number of map of the user" do
  #    map = Map.new(name: "london", city: "london", user_id:  users(:user1).id)
  #    map.save
  #    nbr_map_before = users(:user1).maps.size
  #    map = Map.new(name: "paris", city: "paris", user_id: users(:user1).id)
  #    map.save
  #    nbr_map_after =users(:user1).maps.size
  #    assert_not_equal( nbr_map_before, nbr_map_after)
  #  end


end
