class AddColumsToInfractions < ActiveRecord::Migration
  def change
    add_column :infractions, :type, :string
    add_column :infractions, :cost, :integer
    remove_column :infractions, :description
    remove_column :infractions, :latitude
    remove_column :infractions, :longitude
    remove_column :infractions, :address
    remove_column :infractions, :license_code
    
    


  end
end
