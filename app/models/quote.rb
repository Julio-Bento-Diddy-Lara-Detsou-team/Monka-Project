class Quote < ApplicationRecord  # Validations
  validates :version_number,
            presence: true

  validates :amount,
            presence: true

  # validates :discount

  # validates :sent

  # validates :sending_counter

  # validates :is_invoice

end