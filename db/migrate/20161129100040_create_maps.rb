class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.string :name
      t.boolean :public
      t.integer :longitude
      t.integer :latitude3

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
