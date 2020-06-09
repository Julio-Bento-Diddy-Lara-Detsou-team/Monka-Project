class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :version_number
      t.float :amount
      t.float :discount
      t.date :sent
      t.integer :sending_counter
      t.boolean :is_invoice

      t.timestamps
    end
  end
end
