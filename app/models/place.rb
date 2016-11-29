class Place < ApplicationRecord
  has_many :map_places
  has_many :maps, through: :map_places

end
