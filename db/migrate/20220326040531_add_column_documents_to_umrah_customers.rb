class AddColumnDocumentsToUmrahCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :umrah_customers, :registration_form, :string
    add_column :umrah_customers, :deposit_payment, :string
    add_column :umrah_customers, :final_payment, :string
  end
end
