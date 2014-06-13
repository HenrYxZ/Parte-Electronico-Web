class CreateJoinTableTicketInfraction < ActiveRecord::Migration
  def change
    create_join_table :tickets, :infractions do |t|
      # t.index [:ticket_id, :infraction_id]
      # t.index [:infraction_id, :ticket_id]
    end
  end
end
