class CustomersController < ApplicationController
  include ApplicationHelper

  # before_action :authenticate_user à actionner après tests

  # View list of customers (order most recent first)
  def index
    @customers = Customer.all.order(created_at: :desc)
  end

  # View a customer && all its quote/invoices associated
  def show
    @customer = Customer.find(params[:id])
    @quotes = Quote.all.where(customer_id: params[:id]).order(created_at: :desc)
  end

  # Display a view to create a customer
  def new
    @customer = Customer.new
  end

  # Create a new customer
  def create
    @customer = Customer.new(first_name: params[:first_name],
                             last_name: params[:last_name],
                             company_name: params[:company_name],
                             address: params[:address],
                             zip_code: params[:zip_code],
                             country: params[:country],
                             phone_number: params[:phone_number],
                             company_id: params[:company_id],
                             email: params[:email],
                             user: current_user)

    if @customer.save
      flash[:success] = "Super ! Le client a bien été créé ! "
      redirect_to customers_path
    else
      render 'new'
    end
  end

  # Display a view with a form to edit an existing customer
  def edit
    @customer = Customer.find(params[:id])
    has_rights_user(@customer)
    flash[:notice] = "Tu t'apprêtes à modifier le profil de ce client "
  end

  # Edit an existing customer
  def update
    @customer = Customer.find_by(company_name: params[:company_name])

    if @customer.update(first_name: params[:first_name],
                               last_name: params[:last_name],
                               company_name: params[:company_name],
                               address: params[:address],
                               zip_code: params[:zip_code],
                               country: params[:country],
                               phone_number: params[:phone_number],
                               company_id: params[:company_id],
                               email: params[:email],
                               user: current_user)

      flash[:success] = "Le client a été mis à jour avec succès."
      redirect_to customers_path
    else
      render 'edit'
    end
  end

  # Delete a customer
  def destroy
    Customer.find(params[:id]).delete
    flash[:alert] = "Le client va être supprimé"
    redirect_to customers_path
  end

end