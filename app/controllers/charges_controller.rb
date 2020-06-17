class ChargesController < ApplicationController
  def new
    @quote = Quote.find(params[:quote_id])
  end

  def create
    @quote = Quote.find(params[:quote_id])

    # Amount in cents
    @amount = @quote.amount.to_i * 100

    customer = Stripe::Customer.create(
        [
            email: params[:stripeEmail],
            source: params[:stripeToken]
        ])

    charge = Stripe::Charge.create(
        [
            customer: customer.id,
            amount: @amount,
            description: 'Rails Stripe customer',
            currency: 'EUR'
        ])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_quote_charge_path
  end
end
