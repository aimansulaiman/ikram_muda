class AddUmrahPackageInUmrahCustomer < ActiveRecord::Migration[6.1]
  def change
    add_reference :umrah_customers , :umrah_package , foreign_key: true
  end
end
