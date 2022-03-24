class RemoveForeignKeyInImages < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :images, :umrah_packages
  end
end
