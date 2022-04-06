class AddColumnToUmrahCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column  :umrah_customers, :customer_mahram , :string
    rename_column  :umrah_customers, :address , :home_address
    rename_column  :umrah_customers, :no_tel , :house_tel
    add_column  :umrah_customers, :mobile_tel , :string
    add_column  :umrah_customers, :customer_waris_name , :string
    add_column  :umrah_customers, :waris_address , :string
    add_column  :umrah_customers, :waris_tel , :string
  end
end
