class ChargesController < ApplicationController
  def new
    @quote = Quote.find(params[:quote_id])
  end

  def create
    @quote = Quote.find(params[:quote_id])

    customer = Stripe::Customer.create({
                                           email: params[:stripeEmail],
                                           source: params[:stripeToken],
                                       })

    charge = Stripe::Charge.create({
                                       customer: customer.id,
                                       amount: @quote.amount,
                                       description: 'Rails Stripe customer',
                                       currency: 'usd',
                                   })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


end
