class QuotePdf < Prawn::Document
  def initialize(quote, user , view)
    super(top_margin: 70)
    @quote = quote
    @user = user
    @view = view

    quote_number
    destination_address
    sender_address
    show_goods
    total_price
    terms_and_conditions
  end

  def quote_number
    if @quote.is_invoice == false
    text_box "Devis #{@quote.quote_number}",
             :at => [0, 650],
             :height => 100,
             :width => 150
    else
      text_box "Facture #{@quote.invoice_number}",
               :at => [0, 650],
               :height => 100,
               :width => 150
      end
  end

  def destination_address
    text_box"#{@quote.customer.company_name} #{@quote.customer.address} #{@quote.customer.zip_code} #{@quote.customer.country}",
            :at => [0, 600],
            :height => 100,
            :width => 150
  end

  def sender_address
    text_box"#{@user.company_name} #{@user.address} #{@user.zip_code} #{@user.country}",
    :at => [400, 600],
        :height => 100,
        :width => 150
  end

  def show_goods
    move_down 200
    table show_goods_rows do
      row(0).font_style = :bold
    end
  end

  def show_goods_rows

    data = [["Produit/Service", "Description", "Quantité", "prix"]]
    @quote.goods.each do |good|
      data << [good.title, good.description, good.quantity, price(good.price)]
    end
    data
  end

  def terms_and_conditions
    if @quote.is_invoice == true
    move_down 200
    text "Termes et conditions"
    text "Les sommes étant arrondies, le total des sommes unitaires peut différer du montant total prélevé. Sans escompte. En cas de retard de paiement, application d’un taux égal à trois fois le taux d’intérêt et légal calculé sur le montant des sommes dues TTC à compter du 1er jour de retard suivant la date de paiement portée sur la facture et comprenant un minimum de perception de 7.50€, et pour les professionnels, application d’une indemnité forfaitaire pour frais de recouvrement de 40€. "

    else move_down 200
    text "Termes et conditions"
    text "Ce devis est valable 30 jours à compté de sa réception."
    end
  end

  def price(num)
    @view.number_to_currency(num,:unit => '€')
  end

  def total_price
    move_down 20
    total_price = 0
    @quote.goods.each do |good|
      [good.quantity, good.price]
      total_price += good.price * good.quantity
    end
    text "Prix Total:  #{price(total_price)}"
  end


end