class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @invoices = Quote.all
    @paid_invoices = Quote.where(is_paid: true)
    @unpayed_invoices = Quote.where(is_paid: false, is_invoice: true).count
  end
end
