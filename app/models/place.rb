class Place < ApplicationRecord
  has_many :map_places
  has_many :maps, through: :map_places

validates :title, :latitude, :longitude, presence: true

def placecreation

end

end
