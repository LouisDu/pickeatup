class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def show
    @place = Place.find(params[:id])
    @user = current_user
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meal = Meal.new(meal_params)
    @meal.restaurant = @restaurant

    if @meal.save
      redirect_to restaurant_meal_path(@meal.restaurant, @meal)
    else
      render 'restaurants/show'
    end
  end

private

  def meal_params
    params.require(:meal).permit( :name,
                                  :price,
                                  :route,
                                  :picture,
                                  :picture_cache,
                                  :prep_time,
                                  :description,
                                  :meal_type_id,
                                  :restaurant_id )
  end
end
