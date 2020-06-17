class QuoteMailer < ApplicationMailer
  default from: 'moufaca755@gmail.com' #monka website sends a payment requirement mail on behalf of user

  def payment_email(quote)
    @user = quote.user
    @quote = quote
    @customer = quote.customer
    @url = "https://monka-project.herokuapp.com/quotes/#{@quote.id}/charges/new"
    mail(to: @customer.email, subject: "Demande de paiement #{@quote.quote_number}",
         cc: @user.email)
  end
end
