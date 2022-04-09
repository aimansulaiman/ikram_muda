class Admin::UmrahPackage < ApplicationRecord
  belongs_to :image, optional: true

  accepts_nested_attributes_for :image
  
  def is_poster_available
    self.image.picture.url || nil
  end

end
