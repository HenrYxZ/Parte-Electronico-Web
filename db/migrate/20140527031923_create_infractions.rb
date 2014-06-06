class CreateInfractions < ActiveRecord::Migration
  def change
    create_table :infractions do |t|
      t.string :description
      t.integer :latitude
      t.integer :longitude
      t.string :address
      t.string :license_code

      t.timestamps
    end
  end
end
