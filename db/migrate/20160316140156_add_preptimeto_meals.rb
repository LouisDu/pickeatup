class AddPreptimetoMeals < ActiveRecord::Migration
  def change
    add_column :meals, :prep_time, :integer
  end
end
