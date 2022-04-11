class Admin::UmrahPackage < ApplicationRecord
  belongs_to :image, optional: true

  validate :price_format

  attributes_to_validate = [:title]

  attributes_to_validate.each do |attr|
    validates attr, presence: true
  end

  PRICE_REGEXP = /\A\d+(?:\.\d{0,2})?\z/.freeze

  accepts_nested_attributes_for :image

  def is_poster_available
    self.image.picture.url || nil
  end


  private
  def price_format
    package_price = read_attribute_before_type_cast('price')
    price_with_no_comma = package_price.gsub(',','')

    unless price_with_no_comma =~ PRICE_REGEXP
      errors.add('price', 'must match the correct format e.g 6900.00')
    end
  end

end
