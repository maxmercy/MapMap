class Map < ApplicationRecord
  belongs_to :user
  has_many :map_places
  has_many :places, through: :map_places
end
