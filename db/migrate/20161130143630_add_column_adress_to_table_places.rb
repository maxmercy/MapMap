class AddColumnAdressToTablePlaces < ActiveRecord::Migration[5.0]
  def change
        add_column :places, :phone_number, :string
        add_column :places, :gmap_url, :string
  end
end
