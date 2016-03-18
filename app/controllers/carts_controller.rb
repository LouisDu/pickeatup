class CartsController < ApplicationController

  def add_to_cart
    user = current_user
    order = user.orders.build
    if session[:cart].presence

      @order_line = OrderLine.new(order_line_params)
      build_order_lines_from_session(order)
      session[:cart] = []
      if order.order_lines.select { |ol| ol.meal_id == @order_line.meal_id }.present?
        order.order_lines.select { |ol| ol.meal_id == @order_line.meal_id }.first.meal_quantity += 1
      else
        order.order_lines.build(order_line_params)
      end
      order.order_lines.each do |order_line|
        session[:cart] << order_line
      end

    else
      session[:cart] << order.order_lines.build(order_line_params)
    end

    session[:bill] = order.set_bill
    session[:pick_up_time] = order.set_pick_up_time
    @meal = Meal.find(params[:order_line][:meal_id])
    redirect_to meal_path(@meal)
  end

  def delete_from_cart
    user = current_user
    order = user.orders.build
    if session[:cart].presence
      @order_line = OrderLine.new(order_line_params)
      build_order_lines_from_session(order)
      session[:cart] = []
      if order.order_lines.select { |ol| ol.meal_id == @order_line.meal_id }.first.meal_quantity > 1
        order.order_lines.select { |ol| ol.meal_id == @order_line.meal_id }.first.meal_quantity -= 1
      else
        order = order.order_lines.reject { |ol| ol.meal_id == @order_line.meal_id }
      end
    end

    if session[:cart].presence
      order.order_lines.each do |order_line|
        session[:cart] << order_line
      end
      session[:bill] = order.set_bill
      session[:pick_up_time] = order.set_pick_up_time
    else
      session[:bill] = 0
      session[:pick_up_time] = 0
    end
    @meal = Meal.find(params[:order_line][:meal_id])
    redirect_to meal_path(@meal)
  end

  private

  def order_line_params
    params.require(:order_line).permit(:meal_quantity,
                                       :meal_id,
                                       :meal_price)
  end

  def build_order_lines_from_session(order)
    session[:cart].each do |order_line_hash|
      order.order_lines.build(meal_quantity: order_line_hash["meal_quantity"], meal_id: order_line_hash["meal_id"], meal_price: order_line_hash["meal_price"])
    end
  end

  def order_params
    params.require(:order).permit(:user_id)
  end
end

