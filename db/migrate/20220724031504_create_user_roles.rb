class CreateUserRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_roles do |t|
      t.string :name
      t.string :email
      t.string :roles
      t.timestamps
    end
  end
end
