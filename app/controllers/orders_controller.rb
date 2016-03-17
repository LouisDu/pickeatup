class OrdersController < ApplicationController

  def new
    @user = current_user
    @order = Order.new
  end

  def create
    @user = current_user
    @order = @user.orders.build(order_params)

    session[:cart].each do |order_line_hash|
      order.order_lines.build(meal_quantity: order_line_hash["meal_quantity"], meal_id: order_line_hash["meal_id"], meal_price: order_line_hash["meal_price"])
      @order_line.save
    end

    if @order.save
      redirect_to @order
    else
      render "meals/show"
    end
  end

private
  def order_params
    params.require(:order).permit(:user_id)
  end

end

