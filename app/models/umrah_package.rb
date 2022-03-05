class UmrahPackage < ApplicationRecord
  has_one :image, dependent: :destroy
end
