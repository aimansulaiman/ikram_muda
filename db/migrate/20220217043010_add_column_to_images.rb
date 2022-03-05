class AddColumnToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :umrah_package, foreign_key:true
  end
end
