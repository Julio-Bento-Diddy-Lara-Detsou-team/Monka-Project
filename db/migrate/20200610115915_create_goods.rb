class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.float :price
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
