class QuotesController < ApplicationController
  include ApplicationHelper

  before_action :find_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quote_table = Quote.all
    @quotes = Quote.where(is_invoice: false)
    @invoices = Quote.where(is_invoice: true)
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
  end

  private

  def find_quote
    @quote = Quote.find(params[:id])
  end
end
