class Admin::UmrahCustomer < ApplicationRecord
  attribute :total_participants, :integer, default: 1
  enum is_full_payment_made: { no_payment:0 , partial_payment: 1, full_payment: 2, extra_payment:3 }

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
  belongs_to :umrah_package, class_name: 'Admin::UmrahPackage'

  mount_uploader :quotation_form, AttachmentUploader
  mount_uploader :registration_form, AttachmentUploader
  mount_uploader :deposit_payment, AttachmentUploader
  mount_uploader :final_payment, AttachmentUploader

  def payment_status
    if self.total_paid.present?
      total_paid = self.total_paid.gsub(",", "")
      is_full_payment_made = total_paid.to_i - self.umrah_package.price.to_i
      if total_paid.to_i == 0
        "No payment"
      elsif is_full_payment_made == 0
        "Full payment made"
      elsif is_full_payment_made < 0
        "Partial payment made"
      elsif is_full_payment_made > 0
        "Extra payment made"
      end
    end
  end

  private

  def price_format
    total_paid = read_attribute_before_type_cast('total_paid')
    total_paid_no_comma = total_paid.gsub(',', '')
    byebug
    unless total_paid_no_comma =~ PRICE_REGEXP
      errors.add('total_paid', 'must match the correct format e.g 6900.00')
    end
  end

end
