class FixUmrahPackageColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :umrah_packages, :type, :package_type
  end
end
