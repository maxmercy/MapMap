class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.integer :longitude
      t.integer :latitude
      t.integer :rating
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
