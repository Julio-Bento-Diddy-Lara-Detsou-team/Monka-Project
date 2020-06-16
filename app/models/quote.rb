class Quote < ApplicationRecord
  # Relations with other tables
  belongs_to :user
  belongs_to :customer
  has_many :join_goods_quotes_tables
  has_many :goods, through: :join_goods_quotes_tables


# Validations
#   validates :version_number,
#             presence: true

  validates :amount,
            presence: true

  # validates :discount

  # validates :sent

  # validates :sending_counter

  # validates :is_invoice

#   Action Mailer method to send email to customer

  #
  def payment_send
    QuoteMailer.payment_email(self).deliver_now
  end

end
