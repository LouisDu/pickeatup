class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
    @user = current_user
    @review = Review.new
    @cart = OrderLine.new
    @order = Order.new
  end

  def show
    @user = current_user
    @review = Review.new
    @cart = OrderLine.new
    @order = Order.new
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meal = Meal.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meal = @restaurant.meals.build(meal_params)

    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = @meal.restaurant
    @meal.destroy
    redirect_to @restaurant
  end

private

  def set_meal
    @meal = Meal.find(params[:id])
  end

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
