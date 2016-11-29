class ChangeCoordtoFloat < ActiveRecord::Migration[5.0]
  def change
       change_column :maps, :longitude, :float
       change_column :maps, :latitude, :float
       change_column :places, :longitude, :float
       change_column :places, :latitude, :float

  end
end
