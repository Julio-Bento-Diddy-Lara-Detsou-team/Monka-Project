class ApplicationMailer < ActionMailer::Base
  default from: 'moufaca755@gmail.com'
  layout 'mailer'

  # def cart_price(order)
  #   @cart = order.user.cart
  #   @cart_price = 0
  #   @cart.items.each do |item|
  #     @cart_price += item.price
  #   end
  #   @cart_price
  # end
end
