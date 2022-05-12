class RemoveColumnToUmrahPackages < ActiveRecord::Migration[6.1]
  def change
    remove_column  :umrah_packages, :number_of_rooms
  end
end
