class UpdateColumUserRatingFromTableMapPlace < ActiveRecord::Migration[5.0]
  def change
     add_column :map_places, :sprite_number, :integer
  end
end
