class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
	  t.string :title
	  t.integer :work_id
	  t.belongs_to :work, index: true

      t.timestamps null: false
    end
  end
end