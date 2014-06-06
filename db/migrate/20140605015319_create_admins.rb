class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password_digest, :string, limit: 100

      t.timestamps
    end
  end
end
