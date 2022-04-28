class AddUmrahStatusToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :umrah_customers, :umrah_status, :integer, default: 0
  end
end
