class QuotesController < ApplicationController
  include ApplicationHelper

  before_action :find_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
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
