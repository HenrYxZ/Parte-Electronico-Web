class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :precint, :string
    add_column :users, :courthouse_number, :integer
    add_column :users, :courthouse_city, :string
    add_column :users, :plaque, :string
    remove_column :users, :name
    remove_column :users, :rut
    remove_column :users, :mail
    remove_column :users, :phone
    remove_column :users, :position
  end
end
