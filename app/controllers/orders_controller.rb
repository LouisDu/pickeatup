class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order_line = Order_line.find(params[:order_line_id])
    @order = @order_line.orders.build(requester_id: current_user.id)
         # --> orders , est ce meals?
  end

  def create
    @order_line = Order_line.find(params[:order_line_id])

    @order = @order_line.orders.build(requester: current_user)
             # --> orders , est ce meals?

    @order.update(order_params)

    if @order.save
      flash[:notice] = "Order request successfully created."

      ::Orders::ToRequesterMailer.creation(@order).deliver_now
      ::Orders::ToOwnerMailer.creation(@order).deliver_now

      redirect_to account_travels_path
    else
      if @order.errors.messages[:requester]
        flash[:alert] = "You can't book your own order_line."
      elsif @order.errors.messages[:period]
        flash[:alert] = "This flat has already been booked for this period."
      else
        flash[:alert] = "A problem occured saving your request."
      end
      render :new
    end
  end

private
  def order_params
    params.require(:order).permit(:pick_up_time, :bill, :end_date)
  end
end

# 1 order a plusieur order_line
#   car 1 order_line = 1 produit 1 prix
