class AddColumnToUmrahPackage < ActiveRecord::Migration[6.1]
  def change
    add_column :umrah_packages, :hotel_madinah, :string
    rename_column :umrah_packages,:hotel, :hotel_mekah
  end
end
