class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :rut
      t.string :mail
      t.integer :phone
      t.string :position
      t.string :rank

      t.timestamps
    end
  end
end
