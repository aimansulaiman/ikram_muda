class AddFlightDetailsToUmrahCustomer < ActiveRecord::Migration[6.1]
  def change
    add_reference :umrah_customers, :flight_inbound_detail,  foreign_key: true
    add_reference :umrah_customers, :flight_outbound_detail,  foreign_key: true
  end
end
