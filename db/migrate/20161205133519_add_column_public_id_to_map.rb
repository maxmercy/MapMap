class AddColumnPublicIdToMap < ActiveRecord::Migration[5.0]
  def change
        add_column :maps, :public_id, :string
  end
end
