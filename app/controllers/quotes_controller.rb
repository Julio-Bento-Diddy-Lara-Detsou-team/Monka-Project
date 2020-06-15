class QuotesController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :find_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quote_table = current_user.quotes.all
    @quotes = current_user.quotes.where(is_invoice: false)
    @invoices = current_user.quotes.where(is_invoice: true)
  end

  def show
    @goods = @quote.goods
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
          invoice_number: @quote.invoice_number = "#{current_user.first_name[0]}#{current_user.last_name[0]}#{DateTime.now.strftime("%d%m%Y%H%M")}"
      )

      flash[:success] = "Le devis a été transformé en facture"
    end

    redirect_to :quotes
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: "L'objet a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  private

  def find_quote
    @quote = Quote.find(params[:id])
  end
end

