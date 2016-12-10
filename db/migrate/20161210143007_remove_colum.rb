class RemoveColum < ActiveRecord::Migration[5.0]
  def change
    remove_column :map_places, :category_id
  end
end
