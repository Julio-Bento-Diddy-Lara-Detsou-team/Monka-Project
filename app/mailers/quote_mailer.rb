class QuoteMailer < ApplicationMailer
  default from: 'moufaca755@gmail.com' #monka website sends a payment requirement mail on behalf of user

  def payment_email(quote)
    @user = quote.user
    @quote = quote
    @customer = quote.customer
    @url = 'https://monsite.com/'
    mail(to: @customer.email, subject: "Demande de paiement #{@quote.quote_number}",
         cc: @user.email)
    # attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
    flash[:success] = "Votre document a bien été envoyé par mail !"
    redirect_back(fallback_location: quotes_path)
  end
end
