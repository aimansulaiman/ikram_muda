class RemoveUmrahPackagesIdFromImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :umrah_packages_id
  end
end
