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
    @quote.update
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
