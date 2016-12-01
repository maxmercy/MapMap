class Map < ApplicationRecord
  belongs_to :user
  has_many :map_places
  has_many :places, through: :map_places

  validates :latitude, :longitude, presence: true

  before_validation :geolocate

  def geolocate
    geocord_city = Geocoder.search(city).first
    coord_city = geocord_city.coordinates
    self.latitude = coord_city[0]
    self.longitude = coord_city[1]
  end
end
