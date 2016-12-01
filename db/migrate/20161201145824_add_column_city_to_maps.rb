class AddColumnCityToMaps < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :city, :string
  end
end
