class QuotePdf < Prawn::Document
  def initialize(quote)
    super(top_margin: 70)
    @quote = quote
    text "Devis #{@quote.quote_number} "
  end

end