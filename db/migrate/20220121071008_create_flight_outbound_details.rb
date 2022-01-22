class CreateFlightOutboundDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :flight_outbound_details do |t|
      t.date :flight_departure_date_from_kl
      t.string :flight_time_from_kl
      t.date :landing_date_in_saudi
      t.string :landing_time_in_saudi
      t.timestamps
    end
  end
end
