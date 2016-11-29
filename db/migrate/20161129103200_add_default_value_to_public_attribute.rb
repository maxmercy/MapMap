class AddDefaultValueToPublicAttribute < ActiveRecord::Migration[5.0]
  def change
      change_column_default :maps, :public, true
  end
end
