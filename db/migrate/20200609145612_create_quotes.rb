class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :quote_number
      t.string :invoice_number
      t.float :amount
      t.float :discount
      t.date :quote_sending_date
      t.date :invoice_sending_date
      t.integer :quote_sending_counter
      t.integer :invoice_sending_counter
      t.boolean :is_invoice
      t.boolean :is_paid

      t.belongs_to :user, index: true
      t.belongs_to :customer, index: true

      t.timestamps
    end
  end
end
