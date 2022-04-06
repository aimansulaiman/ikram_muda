class AddPackageFullNameToPackage < ActiveRecord::Migration[6.1]
  def change
    add_column :umrah_packages, :package_full_name, :string
  end
end
