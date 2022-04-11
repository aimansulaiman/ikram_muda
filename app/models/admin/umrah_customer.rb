class Admin::UmrahCustomer < ApplicationRecord
  attribute :total_participants, :integer, default: 1

  attributes_to_validate = [
    :customer_name,
    :identification_card,
    :home_address,
    :mobile_tel,
    :citizenship,
  ]

  attributes_to_validate.each do |attr|
    validates attr, presence: true
  end

  validate :price_format
  PRICE_REGEXP = /\A\d+(?:\.\d{0,2})?\z/.freeze

  validates :identification_card, numericality: true

  belongs_to :flight_inbound_detail
  belongs_to :flight_outbound_detail
  belongs_to :umrah_package

  mount_uploader :quotation_form, AttachmentUploader

  mount_uploader :registration_form, AttachmentUploader

  mount_uploader :deposit_payment, AttachmentUploader

  mount_uploader :final_payment, AttachmentUploader

  private

  def price_format

    total_paid = read_attribute_before_type_cast('total_paid')
    total_paid_no_comma = total_paid.gsub(',','')

    unless total_paid_no_comma =~ PRICE_REGEXP
      errors.add('total_paid', 'must match the correct format e.g 6900.00')
    end


  end

end
