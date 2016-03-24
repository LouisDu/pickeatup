class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :empty_cart, only: [:index]

  def index
    @meals = []
    @user = current_user
    @cart = OrderLine.new
    @order = Order.new

    @search_params = {
      price: params.fetch(:search_meal, {})[:query_max_price].to_i > 0 ? params.fetch(:search_meal, {})[:query_max_price].to_i : 100,
      name: params.fetch(:search_meal, {})[:query_name].to_s,
      address: params.fetch(:search_meal, {})[:query_address].to_s
    }

    @all_meals = policy_scope(Meal)

    if @search_params[:name] == ""
      @meals = @all_meals
    else
      @all_meals = PgSearch.multisearch(@search_params[:name])
      @all_meals.each do |meal|
        @meals << Meal.find(meal.searchable_id)
      end
    end


    @meals = @meals.select { |meal| meal.restaurant.distance_from(@search_params[:address]) <= 1 } unless @search_params[:address] == ""
    @meals = @meals.select { |meal| meal.meal_type.name == 'Plats' }
    @meals = @meals.select { |meal| meal.price <= @search_params[:price]  }
    @meals = @meals.sort_by { |meal| meal.average_rating }.reverse
    @meals = @meals.first(4)

    @markers = Gmaps4rails.build_markers(@meals) do |meal, marker|
     marker.lat meal.restaurant.latitude
     marker.lng meal.restaurant.longitude
     marker.infowindow render_to_string(:partial => '/layouts/map_box', locals: {meal: meal})
    end
  end

  def show
    @user = current_user
    @review = Review.new
    @cart = OrderLine.new
    @order = Order.new
    authorize @meal
    @restaurant_meal = Meal.where(restaurant_id: @meal.restaurant_id)
    @entree = @restaurant_meal.where(meal_type_id: 1)
    @plat = @restaurant_meal.where(meal_type_id: 2).where.not(name: @meal.name)
    @boisson = @restaurant_meal.where(meal_type_id: 4)
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
