class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  def index
    @goods = Good.all
  end

  def show
  end

  def new
    @good = Good.new
  end

  def edit
  end

  def create
    # Create a new good
    @good = Good.new(good_params)
    @good.user_id = current_user.id

    # Get the selected quote by its id
    # quote = Quote.find(params[:quote_id])
    quote = Quote.first

    # Insert the created good into the list of goods related to the quote
    quote.goods << @good

    respond_to do |format|
      if @good.save
        format.html {
          redirect_to @good
          flash[:success] = "Le produit/service a bien été créé."
        }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html {
          redirect_to @good
          flash[:success] = "Le produit/service a bien été mis à jour."
        }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @good.destroy
    respond_to do |format|
      format.html {
        redirect_to goods_path
        flash[:success] = "Le produit/service a bien été supprimé."
      }
      format.js {}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_good
    @good = Good.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def good_params
    params.require(:good).permit(:title, :description, :quantity, :price, :user_id)
  end
end
