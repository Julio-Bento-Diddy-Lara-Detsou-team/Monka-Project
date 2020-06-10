class JoinGoodsQuotesTable < ApplicationRecord
  belongs_to :quote
  belongs_to :good
end
