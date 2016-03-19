class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @cart = OrderLine.new
    @order = Order.new
    @meals = policy_scope(Meal)
  end

  def show
    @user = current_user
    @review = Review.new
    @cart = OrderLine.new
    @order = Order.new
    authorize @meal
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meal = @restaurant.meals.build
    authorize @meal
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meal = @restaurant.meals.build(meal_params)
    authorize @meal

    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
    @restaurant = @meal.restaurant
    authorize @meal
  end

  def update
    authorize @meal
    @restaurant = @meal.restaurant
    if @meal.update(meal_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    authorize @meal
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
