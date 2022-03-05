class CreateUmrahPackages < ActiveRecord::Migration[6.1]
  def change
    create_table :umrah_packages do |t|
      t.string :title
      t.string :type
      t.float :price
      t.string :hotel
      t.timestamps
    end
  end
end
