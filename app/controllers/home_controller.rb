class HomeController < ApplicationController
  def index
    @invoices = Quote.all

    if current_user
      @paid_invoices = current_user.quotes.where(is_paid: true)
      @unpaid_invoices = current_user.quotes.where(is_paid: false, is_invoice: true)
    end
  end

  def show
  end
end
