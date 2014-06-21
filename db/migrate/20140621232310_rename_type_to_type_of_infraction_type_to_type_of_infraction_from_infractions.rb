class RenameTypeToTypeOfInfractionTypeToTypeOfInfractionFromInfractions < ActiveRecord::Migration
  def change
  	rename_column :infractions, :type, :type_of_infraction
  end
end
