class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :company_id
      t.string :email
      t.boolean :is_professional

      t.timestamps
    end
  end
end
