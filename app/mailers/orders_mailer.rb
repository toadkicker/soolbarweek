class OrdersMailer < ApplicationMailer

  def receipt(user, order)
    @user = user
    @events = order.order_items.map {|item| Event.find(item.event_id)}
    mail(to: user.email, subject: "Sool Bar Week Schedule")
  end

end