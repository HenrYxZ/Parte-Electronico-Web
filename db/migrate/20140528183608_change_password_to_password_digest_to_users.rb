class ChangePasswordToPasswordDigestToUsers < ActiveRecord::Migration
 
  def up
    # cambiamos el nombre de la columna por la convencion de has_secure_password
    rename_column :users, :password, :password_digest
    change_column :users, :password_digest, :string, limit: 100
  end

end
