class MapPlace < ApplicationRecord
  belongs_to :map
  belongs_to :place
  # belongs_to :category
end
