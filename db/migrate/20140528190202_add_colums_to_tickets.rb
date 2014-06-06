class AddColumsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :location, :string
    add_column :tickets, :description, :string
  end
end
