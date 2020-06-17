class AddPaidDateToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :paid_date, :datetime
  end
end
