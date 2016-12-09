class UpdateDefaultValueinSpriteNumber < ActiveRecord::Migration[5.0]
  def change
    change_column_default :map_places, :sprite_number, 16
  end
end
