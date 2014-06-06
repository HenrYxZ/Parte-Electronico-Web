class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :municipality
      t.string :court
      t.string :infractor_name
      t.string :vehicle_plate
      t.string :vehicle
      t.datetime :citation_day

      t.timestamps
    end
  end
end
