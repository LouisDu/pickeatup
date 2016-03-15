class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.float :meal_price
      t.integer :meal_quantity
      t.references :meal, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
