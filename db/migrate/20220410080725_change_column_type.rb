class ChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column(:umrah_packages,:price, :string)
    change_column(:umrah_customers,:total_paid, :string)
    change_column(:umrah_customers,:total_cost, :string)
  end
end
