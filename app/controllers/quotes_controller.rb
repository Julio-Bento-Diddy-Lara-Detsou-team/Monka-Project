class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quote_table = current_user.quotes.all
    @quotes = current_user.quotes.where(is_invoice: false)
    @invoices = current_user.quotes.where(is_invoice: true)
  end

  def show
    @goods = @quote.goods.all
  end

  def new
    @quote = Quote.new
    @quote.goods.build
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
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
          goods_attributes: [:id, :title, :description, :quantity, :price, :user_id])
    end
end
