class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @order_items = current_order.order_items
    begin
      @client_token = Braintree::ClientToken.generate
    rescue Braintree::AuthenticationError
      flash[:danger] = "Unable to connect to payment processor. Payments are unavailable at this time."
    end
  end
end
