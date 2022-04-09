class Image < ApplicationRecord
  has_one :umrah_package, class_name: 'Admin::UmrahPackage'

  mount_uploader :picture, PictureUploader


end
