class AddJanitaAndOtherToUmrahCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column  :umrah_customers, :identification_card , :string
    add_column  :umrah_customers, :gender , :string
    add_column  :umrah_customers, :citizenship , :string
  end
end
