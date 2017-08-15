class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @order_items = current_order.order_items
    @amount = Money.new(current_order.set_subtotal).exchange_to(:USD)
  end
end
