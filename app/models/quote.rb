class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_many :join_goods_quotes_tables
  has_many :goods, through: :join_goods_quotes_tables

  validates :amount,
            presence: true
end
