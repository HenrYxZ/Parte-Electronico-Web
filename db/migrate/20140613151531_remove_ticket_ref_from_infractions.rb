class RemoveTicketRefFromInfractions < ActiveRecord::Migration
  def change
  	remove_column :infractions, :ticket_id	
  end
end
