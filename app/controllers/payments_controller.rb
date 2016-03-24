class PaymentsController < ApplicationController
  before_action :set_order

  def new
    authorize @order
    @order.status = "Pending"
  end

  def create
  authorize @order
  @amount = @order.set_bill

  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email: params[:stripeEmail]
  )
  # You should store this customer id and re-use it.

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount:       (@amount*100).to_i,
    description:  "Commande PickEatup",
    currency:     'eur'
  )
  @order.status = "Payed"
  @order.save
  redirect_to orders_path

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_payment_path(@order)

  end

private

  def set_order
    @order = Order.where(status: 'Pending').find(params[:order_id])
  end
end
