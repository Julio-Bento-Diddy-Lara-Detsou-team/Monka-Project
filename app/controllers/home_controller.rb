class HomeController < ApplicationController
  def index
    if current_user
      @date = Time.now.strftime("%B %Y")
      @invoices = Quote.all

      @paid_invoices = current_user.quotes.where(is_paid: true)
      @unpaid_invoices = current_user.quotes.where(is_paid: false, is_invoice: true)
      @month_invoices = current_user.quotes.where(is_paid: true).where("quote_sending_date >= Now() OR invoice_sending_date >= Now()")
    end
  end

  def show
  end
end
