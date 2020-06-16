class QuotePdf < Prawn::Document
  def initialize(quote, user)
    super(top_margin: 70)
    @quote = quote
    @user = user
    quote_number
    destination_address
    sender_address
    show_goods
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
    text "#{@user.company_name}"
    text "#{@user.address}"
    text "#{@user.zip_code} #{@user.country}"
  end

  def show_goods
    @quote.goods.each do |good|

    text "#{good.title}"
    text "#{good.description}"
    text "#{good.quantity}"
    text "#{good.price} €"
    text "#{good.quantity * good.price} €"
    end
  end





end