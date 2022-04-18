class AddStatusToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :umrah_customers, :is_full_payment_made, :integer, default:0
  end
end
