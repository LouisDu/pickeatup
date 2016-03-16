class RemovePreptimefromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :prep_time
  end
end
