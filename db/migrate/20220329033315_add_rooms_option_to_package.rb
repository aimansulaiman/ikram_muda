class AddRoomsOptionToPackage < ActiveRecord::Migration[6.1]
  def change
    add_column :umrah_packages, :rooms_per_pax, :integer
  end
end
