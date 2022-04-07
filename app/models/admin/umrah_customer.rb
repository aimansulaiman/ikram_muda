class Admin::UmrahCustomer < ApplicationRecord
  attribute :total_participants,  :integer, default: 1

  belongs_to :flight_inbound_detail
  belongs_to :flight_outbound_detail
  belongs_to :umrah_package

  mount_uploader :quotation_form, AttachmentUploader

  mount_uploader :registration_form, AttachmentUploader

  mount_uploader :deposit_payment, AttachmentUploader

  mount_uploader :final_payment, AttachmentUploader

end
