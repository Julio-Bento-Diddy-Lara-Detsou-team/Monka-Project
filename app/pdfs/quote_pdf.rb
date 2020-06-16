class QuotePdf < Prawn::Document
  def initialize(quote, user)
    super(top_margin: 70)
    @quote = quote
    @user = user
    quote_number
    destination_address
    sender_address
    show_goods
    terms_and_conditions
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
    text_box"#{@user.company_name} #{@user.address} #{@user.zip_code} #{@user.country}",
    :at => [400, 700],
        :height => 100,
        :width => 150
  end

  def show_goods
    total_price = 0
    @quote.goods.each do |good|
      text "#{good.title}"
      text "#{good.description}"
      text "#{good.quantity}"
      text "#{good.price} €"
      total_price = total_price + good.quantity * good.price
    end
    text "Prix Total #{total_price} €"
  end

  def terms_and_conditions
    text "Termes et conditions"
    text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse facilisis feugiat erat, sed porta lacus pellentesque mattis. Suspendisse id vulputate mi. Nunc posuere varius sapien et commodo. Praesent pharetra nibh nulla, vitae cursus tellus semper ut. Sed nisl diam, ultrices id maximus in, mollis eu sapien."
  end





end