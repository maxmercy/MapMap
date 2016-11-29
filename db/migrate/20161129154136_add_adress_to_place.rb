class AddAdressToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :address, :string
  end
end
