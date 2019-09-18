class CreateCargos < ActiveRecord::Migration[5.2]
  def change
    create_table :cargos do |t|
      t.integer :length, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.integer :total_volume, null: false
      t.integer :total_weight, null: false
      t.integer :price

      t.references :departure_city, null: false, index: true, foreign_key: { to_table: 'cities' }
      t.references :delivery_city, null: false, index: true, foreign_key: { to_table: 'cities' }

      t.timestamps
    end
  end
end
