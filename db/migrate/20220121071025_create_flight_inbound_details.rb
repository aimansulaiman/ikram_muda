class CreateFlightInboundDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :flight_inbound_details do |t|
      t.date :flight_departure_date_from_saudi
      t.string :flight_time_from_saudi
      t.date :landing_date_in_kl
      t.string :landing_time_in_kl
      t.timestamps
    end
  end
end
