class OrdersController < ApplicationController

  def show
    @user = current_user
  end

  def new
    @user = current_user
    @order = Order.new
  end

  def create
    @user = current_user
    @order = @user.orders.build(order_params)
    @order.save

    session[:cart].each do |order_line_hash|
      order_line = @order.order_lines.build(meal_quantity: order_line_hash["meal_quantity"], meal_id: order_line_hash["meal_id"], meal_price: order_line_hash["meal_price"])
      order_line.save
    end

    redirect_to @order
  end

private
  def order_params
    params.require(:order).permit(:user_id)
  end

end

