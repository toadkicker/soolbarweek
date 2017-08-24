class ChargesController < ApplicationController

  def index
    @order_status = OrderStatus.find_by_name("Payment Received")
    @user = current_user
    @orders = Order.where(user: current_user, order_status_id: @order_status.id)
  end

  def new
    @payment = Payment.new
  end

  def create
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source => params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => Money.new(current_order.set_subtotal).exchange_to(:USD).cents,
      :description => 'Sool Bar Week',
      :currency => "USD"
    )
    @order_status = OrderStatus.find_by_name("Payment Received")

    current_order.update(order_status_id: @order_status.id)

    OrdersMailer.order(current_user, current_order)

    redirect_to charges_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
