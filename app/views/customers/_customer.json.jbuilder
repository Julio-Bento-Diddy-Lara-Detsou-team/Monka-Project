json.extract! customer, :id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
