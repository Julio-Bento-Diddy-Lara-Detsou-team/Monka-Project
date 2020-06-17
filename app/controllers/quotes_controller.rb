class QuotesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quote_table = current_user.quotes.all
    @quotes = current_user.quotes.where(is_invoice: false)
    @invoices = current_user.quotes.where(is_invoice: true)
  end

  def show
    @goods = @quote.goods
    @user = current_user

    respond_to do |format|
      format.html
      format.pdf do
        pdf = QuotePdf.new(@quote, @user, view_context)
        send_data pdf.render, filename: "Doc_#{@quote.quote_number}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create
  end

  def edit
  end

  def update
    @quote = Quote.find(params[:id])

    # Convert a quote into an invoice
    if params[:convert_to_invoice] === "true" && @quote.is_invoice === false
      @quote.update(
          is_invoice: @quote.is_invoice = true,
          invoice_number: @quote.invoice_number = "#{@quote.customer.first_name[0]}#{@quote.customer.last_name[0]}#{DateTime.now.strftime("%d%m%Y")}",
          invoice_sending_date: @quote.quote_sending_date
      )

      flash[:success] = "Le devis a été transformé en facture"
    end

    redirect_to :quotes
  end

  def destroy
    @quote.destroy
    flash[:error] = "L'élément a bien été supprimé"
    redirect_to :quotes
  end

  #Send mail to customer
  def payment_send
    @quote = Quote.find(params[:id])
    QuoteMailer.payment_email(@quote).deliver_now
    flash[:success] = "Votre document a bien été envoyé par mail !"
    redirect_back(fallback_location: quotes_path)
  end

  private

  def find_quote
    @quote = Quote.find(params[:id])
  end
end

