class CartsController < ApplicationController

  def add_to_cart
    user = current_user
    order = user.orders.build
    if session[:cart].presence
      @order_line = OrderLine.new(order_line_params)
# call the method to build order_lines from session on order
      build_order_lines_from_session(order)
# I empty session
      session[:cart] = []
# I look if the line already exist in order_lines from order
      order.order_lines.each do |order_line|
        if order_line.meal_id == @order_line.meal_id
          order_line.meal_quantity += 1
        else
          order.order_lines.build(order_line_params)
        end
      end
# put back all order_lines in session
      order.order_lines.each do |order_line|
        session[:cart] << order_line
      end
    else
      session[:cart] = []
      session[:cart] << order.order_lines.build(order_line_params)
    end
# set order method
    session[:bill] = order.set_bill
    session[:pick_up_time] = order.set_pick_up_time
# redirect to the instance show
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
      order.order_lines.each do |order_line|
        if order_line.meal_id == @order_line.meal_id
          if order_line.meal_quantity > 1
            order_line.meal_quantity -= 1
          else
            order_line.destroy
          end
        end
      end
      # put back all order_lines in session
      order.order_lines.each do |order_line|
        session[:cart] << order_line
      end
    else
      flash[:notice] = "Vous panier est vide"
    end
# set order method
    session[:bill] = order.set_bill
    session[:pick_up_time] = order.set_pick_up_time
# redirect to the instance show
    @meal = Meal.find(params[:order_line][:meal_id])
    redirect_to meal_path(@meal)
  end

  def empty_cart
    session[:cart] = []
    session[:bill] = []
    session[:pick_up_time] = []
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

