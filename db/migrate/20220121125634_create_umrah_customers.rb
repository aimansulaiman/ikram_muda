class CreateUmrahCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :umrah_customers do |t|
      t.string :customer_name
      t.string :no_tel
      t.string :address
      t.integer :total_participants
      t.date :date_registered
      t.float :total_paid
      t.float :total_cost
      t.timestamps
    end
  end
end
