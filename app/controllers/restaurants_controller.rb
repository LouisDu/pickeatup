class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def show
    @user = current_user
    authorize @restaurant
  end

  def create
    @user = current_user
    @restaurant = @user.restaurants.build(restaurant_params)
    authorize @restaurant

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def edit
    authorize @restaurant
  end

  def update
    authorize @restaurant
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path
  end

private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit( :name,
                                        :street_number,
                                        :route,
                                        :locality,
                                        :administrative_area_level_1,
                                        :postal_code,
                                        :country,
                                        :logo,
                                        :logo_cache,
                                        :restaurant_type_id,
                                        :user_id )
  end
end
