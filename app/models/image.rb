class Image < ApplicationRecord
  belongs_to :umrah_package
  mount_uploader :picture, PictureUploader
end
