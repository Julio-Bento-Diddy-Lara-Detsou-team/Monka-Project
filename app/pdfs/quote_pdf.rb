class QuotePdf < Prawn::Document
  def initialize
    super
    text "Quotes here"
  end

end