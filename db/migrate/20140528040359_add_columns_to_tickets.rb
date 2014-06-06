class AddColumnsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :license_code, :integer
    add_column :tickets, :date, :datetime
    add_column :tickets, :latitude, :integer
    add_column :tickets, :longitude, :integer
    add_column :tickets, :rut, :string
    add_column :tickets, :first_name, :string
    add_column :tickets, :last_name, :string
    add_column :tickets, :address, :string
    add_column :tickets, :email, :string
    remove_column :tickets, :municipality
    remove_column :tickets, :court
    remove_column :tickets, :infractor_name
    remove_column :tickets, :citation_day
  end
end
