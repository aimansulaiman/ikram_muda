class AddColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :umrah_customers, :quotation_form, :string
  end
end
