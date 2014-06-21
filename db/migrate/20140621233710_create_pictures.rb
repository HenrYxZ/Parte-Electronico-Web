class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file_name
      t.string :format
      t.references :ticket, index: true

      t.timestamps
    end
  end
end
