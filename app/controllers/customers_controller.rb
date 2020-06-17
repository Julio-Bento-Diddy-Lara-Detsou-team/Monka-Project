class CustomersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  after_action :customer_to_current_user, only: [:create]

  def index
    @customers = current_user.customers.order("last_name")
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Le client a été créé avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Le client a été mis à jour avec succès.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Le client a été supprimé avec succès.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.fetch(:customer, {}).permit(
        :first_name,
        :last_name,
        :company_name,
        :company_id,
        :email,
        :is_professional,
        :address,
        :zip_code,
        :country,
        :phone_number,
        current_user)
  end

  def customer_to_current_user
    @customer.update(user: current_user, country: "FRANCE")
  end
end
