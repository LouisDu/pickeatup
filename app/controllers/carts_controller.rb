class CartsController < ApplicationController

  def add_to_cart
    if session[:cart].presence
    else
       session[:cart] = []
    end

    session[:cart] << order_line_params
  end

  private

  def order_line_params
    params.require(:order_line).permit(:meal_quantity,
                                       :meal_id)
  end
end
