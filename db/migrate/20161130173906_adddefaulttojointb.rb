class Adddefaulttojointb < ActiveRecord::Migration[5.0]
  def change
    change_column_default :map_places, :comment, ""
    change_column_default :map_places, :user_rating, 0
    change_column_default :map_places, :category_id, 1
  end
end
