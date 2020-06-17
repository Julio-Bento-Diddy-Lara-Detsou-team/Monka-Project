class Good < ApplicationRecord
  belongs_to :user
  has_many :join_goods_quotes_tables
  has_many :quotes, through: :join_goods_quotes_tables

  validates :title,
            presence: true,
            length: { in: 3..50, message: "Veuillez saisir un produit/service entre 3 et 50 caractères"}

  validates :description,
            length: { in: 3..50, message: "Veuillez saisir un produit/service entre 3 et 50 caractère"}

  validates :quantity,
            presence: true

  validates :price,
            presence: true
end
