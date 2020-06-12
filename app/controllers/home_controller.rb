class HomeController < ApplicationController
  def index
    @paid_invoices = Quote.where(is_paid: true)
  end
end
