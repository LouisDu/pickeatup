class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :empty_cart, only: [:index]

  def index
    @user = current_user
    @cart = OrderLine.new
    @order = Order.new
    price1 = params.fetch(:search, {})[:query_max_price].to_i
    price1 = 500 unless price1 > 0
    @meals = policy_scope(Meal.where('name ILIKE :name1 AND price <= :price1',
      { name1: "%#{params.fetch(:search, {})[:query_name]}%",
        price1: price1}))
  end

  def show
    @user = current_user
    @review = Review.new
    @cart = OrderLine.new
    @order = Order.new
    authorize @meal
    @restaurant_meal = Meal.where(restaurant_id: @meal.restaurant_id)
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

  def empty_cart
    session[:cart] = nil
    session[:bill] = nil
    session[:pick_up_time] = nil
  end

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
