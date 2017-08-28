class ChargesController < ApplicationController

  def index
    @order_status = OrderStatus.find_by_name("Payment Received")
    @user = current_user
    @orders = Order.where(user: current_user, order_status_id: @order_status.id)
  end

  def receipt
    @processed_order = Order.where(id: params[:id], user: current_user).first
    OrdersMailer.receipt(current_user, @processed_order).deliver_later
    flash[:success] = t('receipt_sent', default: "A receipt was sent to #{current_user.email}")
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

    @processed_order = OrderItem.current_users_cart(current_user.id).first.order
    OrdersMailer.receipt(current_user, @processed_order).deliver_later
    OrdersMailer.notify(current_user, @processed_order).deliver_later

    redirect_to charges_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  rescue Stripe::InvalidRequestError => e
    flash[:error] = t('charge_timeout', default: "The security token used for processing transactions expired. Please try your purchase again.")
    redirect_to cart_path
  end

end
