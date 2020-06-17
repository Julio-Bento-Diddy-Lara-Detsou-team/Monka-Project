class QuotesController < ApplicationController

  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quote_table = current_user.quotes.all
    @quotes = current_user.quotes.where(is_invoice: false)
    @invoices = current_user.quotes.where(is_invoice: true)
  end

  def show
    @goods = @quote.goods.all
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
    @quote.goods.build
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    # Update the Quote object on wether it is a quote or an invoice
    @quote = save_quote_in_db(@quote)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Le devis ou la facture a bien été créé.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if params[:convert_to_invoice] === "true" && @quote.is_invoice === false
      convert_quote_to_invoice(@quote)
    else
      # Update the Quote object on wether it is a quote or an invoice
      @quote = save_quote_in_db(@quote)

      respond_to do |format|
        if @quote.update(quote_params)
          format.html { redirect_to @quote, notice: 'Le devis ou la facture a bien été mise à jour.' }
        else
          format.html { render :edit }
        end
      end
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Le devis ou la facture a bien été supprimé.' }
      format.js {}
    end
  end

  #Send mail to customer
  def payment_send
    @quote = Quote.find(params[:id])
    QuoteMailer.payment_email(@quote).deliver_now
    flash[:success] = "Votre document a bien été envoyé par mail au client !"
    redirect_back(fallback_location: quotes_path)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quote
    @quote = Quote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def quote_params
    params.require(:quote).permit(
        :quote_number,
        :invoice_number,
        :amount,
        :discount,
        :quote_sending_date,
        :invoice_sending_date,
        :quote_sending_counter,
        :invoice_sending_counter,
        :is_invoice,
        :is_paid,
        :user_id,
        :customer_id,
        :goods,
        goods_attributes: [:id, :title, :description, :quantity, :price, :user_id]
        )
  end

  # Update the Quote object on wether it is a quote or an invoice
  def save_quote_in_db(quote)
    # Allocate the current user creating the quote
    quote.user = current_user

    # By default, allocate a discount to 0
    # TODO : Code a bonus feature allowing to add a discount to a quote
    quote.discount = 0

    # Allocate a quote_number or an invoice_invoice depending on user's choice
    quote_or_invoice_number = "#{current_user.first_name[0]}#{current_user.last_name[0]}#{DateTime.now.strftime("%d%m%Y%H%M")}"

    if quote.is_invoice === false
      quote.quote_number = quote_or_invoice_number
    else
      quote.invoice_number = quote_or_invoice_number
    end

    # Allocate goods to the quotes
    if params[:quote][:goods]
      quote_amount = 0

      params[:quote][:goods].each do |good|
        good if good.empty? === false
        if good.empty? === false
          current_good = Good.find(good)

          # insert good into the list of goods
          quote.goods << current_good

          # Line used to calculate total price of all goods
          quote_amount += current_good.price * current_good.quantity
        end
      end

      quote.amount = quote_amount
    end

    quote
  end

  def convert_quote_to_invoice(quote)
    quote.update(
        is_invoice: true,
        invoice_number: "#{quote.customer.first_name[0]}#{quote.customer.last_name[0]}#{DateTime.now.strftime("%d%m%Y")}",
        invoice_sending_date: @quote.quote_sending_date
    )

    flash[:success] = "Le devis a été transformé en facture"

    redirect_to :quotes
  end
end
