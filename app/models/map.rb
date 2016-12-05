class Map < ApplicationRecord
  belongs_to :user
  has_many :map_places
  has_many :places, through: :map_places

  validates :latitude, :longitude, presence: true

  before_validation :geolocate
  before_save :generate_public_id

  def geolocate
    geocord_city = Geocoder.search(city).first
    coord_city = geocord_city.coordinates
    self.latitude = coord_city[0]
    self.longitude = coord_city[1]
  end

  def duplicate(map_origin)
    map_places_origin = MapPlace.where(map_id: map_origin.id)

    map_places_origin.each do |map_place|
          new_map_place = map_place.dup
          new_map_place.update(map_id: self.id)
          new_map_place.save
    end
  end


private

  def generate_public_id
      self.public_id  = self.city + '_' + SecureRandom.urlsafe_base64
  end

end
