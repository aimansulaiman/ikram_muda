class RemoveForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_column :images , :umrah_package_id
  end
end
