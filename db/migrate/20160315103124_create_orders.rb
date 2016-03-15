class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :pick_up_time
      t.float :bill
      t.string :status, :default => 'Pending'
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
