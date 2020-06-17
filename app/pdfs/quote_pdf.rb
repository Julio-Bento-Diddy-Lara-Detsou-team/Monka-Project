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
    text_box "Devis #{@quote.quote_number}",
    :at => [0, 725],
        :height => 100,
        :width => 150
  end

  def destination_address
    text_box"#{@quote.customer.company_name} #{@quote.customer.address} #{@quote.customer.zip_code} #{@quote.customer.country}",
            :at => [0, 700],
            :height => 100,
            :width => 150
  end

  def sender_address
    text_box"#{@user.company_name} #{@user.address} #{@user.zip_code} #{@user.country}",
    :at => [400, 700],
        :height => 100,
        :width => 150
  end

  def show_goods
    move_down 50
    total_price = 0
    @quote.goods.each do |good|

      data = [[" #{good.title}", "#{good.description}", "#{good.quantity}", " #{good.price} €" ]]
      table(data, :column_widths => {1 => 240}, :position => :center)



      # text "#{good.title}"
      # text "#{good.description}"
      # text "#{good.quantity}"
      # text "#{good.price} €"
      total_price = total_price + good.quantity * good.price
    end

    text "Prix Total #{total_price} €"
  end

  def terms_and_conditions
    move_down 50
    text "Termes et conditions"
    text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse facilisis feugiat erat, sed porta lacus pellentesque mattis. Suspendisse id vulputate mi. Nunc posuere varius sapien et commodo. Praesent pharetra nibh nulla, vitae cursus tellus semper ut. Sed nisl diam, ultrices id maximus in, mollis eu sapien."
  end





end