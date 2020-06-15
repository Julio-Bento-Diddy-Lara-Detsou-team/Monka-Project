json.extract! quote, :id, :quote_number, :invoice_number, :amount, :discount, :quote_sending_date, :invoice_sending_date, :quote_sending_counter, :invoice_sending_counter, :is_invoice, :is_paid, :user_id, :customer_id, :created_at, :updated_at
json.url quote_url(quote, format: :json)
