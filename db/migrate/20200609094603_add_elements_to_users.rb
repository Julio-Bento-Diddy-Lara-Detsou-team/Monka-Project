class AddElementsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :address, :string
    add_column :users, :zip_code, :string
    add_column :users, :country, :string, default: "FRANCE"
    add_column :users, :phone_number, :string
    add_column :users, :company_id, :integer
    add_column :users, :is_admin, :boolean, default: false
  end
end
