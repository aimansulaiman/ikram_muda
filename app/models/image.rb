class Image < ApplicationRecord
  has_one :umrah_package, class_name: 'Admin::UmrahPackage'

  # accepts_nested_attributes_for :umrah_package

  mount_uploader :picture, PictureUploader


end
