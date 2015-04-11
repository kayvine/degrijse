class CreateWorks < ActiveRecord::Migration
  def change
	create_table :works do |t|
	  t.string :title
	  t.text :description
	  t.belongs_to :category, index: true
	  t.integer :category_id

	  t.timestamps null: false
	end

	add_index :works, :category_id
  end
end