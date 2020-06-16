class QuotePdf < Prawn::Document
  def initialize(quote)
    super(top_margin: 70)
    @quote = quote
    quote_number
    destination_address
    sender_address
  end

  def quote_number
    text "Devis #{@quote.quote_number}"
  end

  def destination_address
    text "#{@quote.customer.company_name}"
    text "#{@quote.customer.address}"
    text "#{@quote.customer.zip_code} #{@quote.customer.country}"
  end

  def sender_address

  end





end