class Image < ApplicationRecord
  has_one :umrah_package
  mount_uploader :picture, PictureUploader
end
