ActiveAdmin.register Quote do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :quote_number, :invoice_number, :amount, :discount, :quote_sending_date, :invoice_sending_date, :quote_sending_counter, :invoice_sending_counter, :is_invoice, :is_paid, :user_id, :customer_id, :paid_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:quote_number, :invoice_number, :amount, :discount, :quote_sending_date, :invoice_sending_date, :quote_sending_counter, :invoice_sending_counter, :is_invoice, :is_paid, :user_id, :customer_id, :paid_date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
