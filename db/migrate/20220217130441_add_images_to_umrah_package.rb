class AddImagesToUmrahPackage < ActiveRecord::Migration[6.1]
  def change
    add_reference :umrah_packages, :image, foreign_key: true
  end
end
