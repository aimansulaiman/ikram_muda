class Admin::UmrahPackage < ApplicationRecord
  belongs_to :image, optional: true

  accepts_nested_attributes_for :image

  def is_image_available
    if self.image.nil? || self.image.picture.url.nil?
      false
    else
      true
    end
  end
end
