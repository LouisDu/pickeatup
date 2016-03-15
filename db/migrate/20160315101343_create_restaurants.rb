class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street_number
      t.string :route
      t.string :locality
      t.string :administrative_area_level_1
      t.string :postal_code
      t.string :country
      t.string :logo
      t.references :restaurant_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
