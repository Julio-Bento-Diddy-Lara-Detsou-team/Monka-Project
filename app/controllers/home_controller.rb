class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @invoices = Quote.all
    @paid_invoices = current_user.quotes.where(is_paid: true)
    @unpayed_invoices = current_user.quotes.where(is_paid: false, is_invoice: true).count
  end
end
