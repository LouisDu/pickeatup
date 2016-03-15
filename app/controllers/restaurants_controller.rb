class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
  end

  def create
    @user = current_user
    @restaurant = @user.restaurants.build(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

private

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
