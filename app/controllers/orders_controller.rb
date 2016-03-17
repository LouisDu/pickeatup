class OrdersController < ApplicationController

  def new
    @user = current_user
    @order = Order.new
  end

  def create
    @user = current_user
    @order = @user.orders.build(order_params)

    session[:cart].each do |line|
      @order_line = @order.order_lines.build(line)
      @order_line.meal_price = line.meal_id.price
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


  #   @order = current_order
  #   @order_item = @order.order_items.new(order_item_params)
  #   @order.save
  #   session[:order_id] = @order.id
  # end


  # @order = Order.find(session[:order_id])
  # @order = Order.new
