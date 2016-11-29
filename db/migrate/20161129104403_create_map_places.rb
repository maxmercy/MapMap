class CreateMapPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :map_places do |t|
      t.belongs_to :map, index: true
      t.belongs_to :place, index: true
      t.text :comment
      t.integer :user_rating
      t.timestamps
      t.timestamps
    end
  end
end
