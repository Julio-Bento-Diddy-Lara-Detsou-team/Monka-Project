class Good < ApplicationRecord
  belongs_to :user
  has_many :join_goods_quotes_tables
  has_many :quotes, through: :join_goods_quotes_tables
end
