class CartsController < ApplicationController

  def add_to_cart
    session[:cart] = [] unless session[:cart].presence
    session[:cart] << order_line_params

    @meal = Meal.find(params[:order_line][:meal_id])
    redirect_to meal_path(@meal)
  end

  private

  def order_line_params
    params.require(:order_line).permit(:meal_quantity,
                                       :meal_id)
  end
end

