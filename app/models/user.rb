class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :customers
  has_many :quotes
  has_many :goods
  has_one_attached :logo

  # validates :first_name,
  #           presence: true,
  #           length: { in: 2..30, message: "Veuillez saisir un prénom entre 2 et 30 caractères"}

  # validates :last_name,
  #           presence: true,
  #           length: { in: 2..50, message: "Veuillez saisir un nom doit faire entre 2 et 50 caractères"}

  # validates :company_name,
  #           length: { in: 0..50, message: "Veuillez saisir un nom d'entreprise entre 0 et 50 caractères"}

  # validates :address,
  #           presence: true,
  #           length: { in: 3..200, message: "Veuillez saisir une addresse entre 3 et 200 caractères"}

  # validates :zip_code,
  #           presence: true,
  #           length: { in: 3..10, message: "Votre code postal doit faire entre 3 et 10 caractères"}

  # validates :country,
  #           presence: true

  # validates :phone_number,
  #           presence: true,
  #           format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/, message: 'Veuillez saisir une adresse email valide'}

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

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end

