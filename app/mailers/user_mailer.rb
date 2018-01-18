class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order, cart_total)
    @order = order
    @items = @order.line_items
    @cart_total = cart_total / 100.00
    mail(to: @order.email, subject: "Order has been received! (Order: #{order.id})")
  end
end
