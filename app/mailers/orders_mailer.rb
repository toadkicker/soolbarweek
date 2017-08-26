class OrdersMailer < ApplicationMailer

  def receipt(user, order)
    @user = user
    @events = order.order_items.map {|item| Event.find(item.event_id)}
    mail(to: user.email, from: 'no-reply@soolbarweek.com', subject: "Sool Bar Week Schedule")
  end

  def notify(user, order)
    @user = user
    @events = order.order_items.map {|item| Event.find(item.event_id)}
    mail(to: "bob@soolbarweek.com", from: 'no-reply@soolbarweek.com', subject: "Admin Action: Sool Bar Week")
  end

end