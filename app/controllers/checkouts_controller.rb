class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:notify, :done]
  require 'concerns/payments_service'

  def index
  end

  def notify
    @payment = PaymentService.new(get_host, current_order.set_subtotal)
    if @payment.accept
      redirect_to extract_link(@payment.response)
    else
      render format: :js, notice: 'something went wrong '
    end
  end

  def done
    payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    payment.execute(payer_id: params[:PayerID])
    @amount = payment.transactions.first.amount.total
    save_record(payment)
  end

  def cancel
    redirect_to '/', notice: t('canceled_payment')
  end

  private

  def detail
    params.permit(:amount, :card)
  end

  def get_host
    request.base_url
  end

  def extract_link(data)
    data.links.find { |link| link.rel == 'approval_url' }.href
  end

  def save_record(payment)
    payer = payment.payer.payer_info
    full_name = payer.first_name + ' ' + payer.last_name
    description = payment.transactions.first.description
    amount = payment.transactions.first.amount.total
    attributes = payment_structure(description, amount, full_name, payment.create_time)
    Payment.create attributes
  end

  def payment_structure(concern, amount, payer, paid_at)
    {
      concern: concern,
      amount: amount,
      payer: payer,
      paid_at: paid_at
    }
  end
end
