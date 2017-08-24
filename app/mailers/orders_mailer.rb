class OrdersMailer < ApplicationMailer

  def order(user, order)
    @user = user
    @events = order.order_items.map {|item| Event.find(item.event_id)}
    mail(to: 'bob@soolbarweek.com') do |format|
      format.html {render 'orders_mailer/order'}
      format.text {render 'orders_mailer/order'}
    end
  end

end