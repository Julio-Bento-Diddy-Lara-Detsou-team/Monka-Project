class CreateJoinGoodsQuotesTables < ActiveRecord::Migration[5.2]
  def change
    create_table :join_goods_quotes_tables do |t|
      t.belongs_to :good, index: true
      t.belongs_to :quote, index: true

      t.timestamps
    end
  end
end
