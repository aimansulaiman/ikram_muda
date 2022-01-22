class UmrahCustomer < ApplicationRecord
  belongs_to :flight_inbound_detail
  belongs_to :flight_outbound_detail


end
