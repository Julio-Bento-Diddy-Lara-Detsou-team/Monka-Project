class Quote < ApplicationRecord
  # Relations with other tables
  belongs_to :user
  belongs_to :customer


# Validations
  validates :version_number,
            presence: true

  validates :amount,
            presence: true

  # validates :discount

  # validates :sent

  # validates :sending_counter

  # validates :is_invoice

end
