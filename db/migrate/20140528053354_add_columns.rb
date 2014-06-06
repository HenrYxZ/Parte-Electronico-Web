class AddColumns < ActiveRecord::Migration
  def change
  	add_column :infractions, :ticket_id, :integer
  	add_column :tickets, :user_id, :integer
  end
end
