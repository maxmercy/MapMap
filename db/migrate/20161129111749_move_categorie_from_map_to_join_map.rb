class MoveCategorieFromMapToJoinMap < ActiveRecord::Migration[5.0]
  def change
    remove_column  :maps, :category_id
    add_reference :map_places, :category, index:true
  end
end
