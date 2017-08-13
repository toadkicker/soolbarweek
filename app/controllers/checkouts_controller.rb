class CheckoutsController < ApplicationController
  def new
    items_list = current_order.map { |item| { name: item.title, sku: item.id, price: item.price, currency: Money.default_currency, quantity: item.quantity } }
    @payment = Payment.new(intent: 'sale',
                           payer: {
                             payment_method: 'paypal'
                           },
                           redirect_urls: {
                             return_url: 'http://localhost:3000/payment/execute',
                             cancel_url: 'http://localhost:3000/'
                           },
                           transactions: [{
                             item_list: {
                               items: items_list
                             },
                             amount: {
                               total: current_order.subtotal,
                               currency: Money.default_currency
                             },
                             description: 'This is the payment transaction description.'
                           }])
    if @payment.errors.present?
      @payment.errors.each do |err|
        flash[:error] = err
      end
    end
  end

  def show
    @receipt = ''
  end

  def create
    amount = current_order.subtotal
    nonce = params['payment_method_nonce']
  end
end
