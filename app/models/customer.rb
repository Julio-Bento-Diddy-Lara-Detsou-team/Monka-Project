class Customer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :quotes, dependent: :destroy

  # validates :first_name,
  #           presence: true,
  #           length: { in: 2..30, message: "Veuillez saisir un prénom entre 2 et 30 caractères"}

  # validates :last_name,
  #           presence: true,
  #           length: { in: 2..50, message: "Veuillez saisir un nom entre 2 et 50 caractères"}

  # validates :company_name,
  #           length: { in: 0..50, message: "Veuillez saisir un nom d'entreprise entre 0 et 50 caractères"}

  # validates :address,
  #           presence: true,
  #           length: { in: 3..200, message: "Veuillez saisir une addresse entre 3 et 200 caractères"}

  # validates :zip_code,
  #           presence: true,
  #           length: { in: 3..10, message: "Le code postal doit faire entre 3 et 10 caractères"}

  # validates :country,
  #           presence: true

  # validates :phone_number,
  #           format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/, message: 'Veuillez saisir un numéro de téléphone valide'}

  # validates :company_id,
  #           presence: true,
  #           uniqueness: true,
  #           length: {in: 8..15, message: "Veuillez saisir un numéro de SIRET / SIREN entre 9 et 14 caractères"},
  #           format: { with: /\A[+-]?\d+\z/, message: 'Veuillez saisir un numéro de SIRET / SIREN valide'}

  # validates :email,
  #           uniqueness: true,
  #           presence: true,
  #           format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Veuillez saisir une adresse email valide'},
  #           length: { maximum: 256, message: 'Veuillez saisir une adresse email valide' }
end
