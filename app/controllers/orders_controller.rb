class OrdersController < ApplicationController

  def index
    #@orders = current_user.orders.reverse
    @orders = policy_scope(Order)
  end

  def show
    @order = current_user.orders.last
    authorize @order
    @restaurant = @order.order_lines.first.meal.restaurant
    @markers = Gmaps4rails.build_markers(@restaurant) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
    end
  end

  def new
    @user = current_user
    @order = Order.new
    authorize @order
  end

  def create
    @user = current_user
    @order = @user.orders.build(order_params)
    @order.save
    authorize @order

    session[:cart].each do |order_line_hash|
      order_line = @order.order_lines.build(meal_quantity: order_line_hash["meal_quantity"], meal_id: order_line_hash["meal_id"], meal_price: order_line_hash["meal_price"])
      order_line.save
    end

    @order.set_pick_up_time
    @order.set_bill

    @order.save

    redirect_to new_order_payment_path(@order)
  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    if @order.update(order_params)
      redirect_to :back
    else
      render :back
    end
  end

private
  def order_params
    params.require(:order).permit(:user_id, :status)
  end

end

