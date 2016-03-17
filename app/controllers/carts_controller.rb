class CartsController < ApplicationController

  def add_to_cart
    @user = current_user
    order = @user.orders.build
    if session[:cart].presence
      session[:cart] << OrderLine.new(order_line_params)
      session[:cart].each do |order_line|
        order.order_lines.build(meal_quantity: order_line["meal_quantity"], meal_id: order_line["meal_id"], meal_price: order_line["meal_price"])
      end
    else
      session[:cart] = []
      @order_line = order.order_lines.build(order_line_params)
      session[:cart] << @order_line
    end
    session[:bill] = order.set_bill
    session[:pick_up_time] = order.set_pick_up_time
    @meal = Meal.find(params[:order_line][:meal_id])
    redirect_to meal_path(@meal)
  end

  private

  def order_line_params
    params.require(:order_line).permit(:meal_quantity,
                                       :meal_id,
                                       :meal_price)
  end

  def order_params
    params.require(:order).permit(:user_id)
  end
end

