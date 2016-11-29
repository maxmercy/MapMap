class MoveCategorieFromPlaceToMap < ActiveRecord::Migration[5.0]
  def change
    remove_column  :places, :category_id


    add_reference :maps, :category, index:true
  end
end
