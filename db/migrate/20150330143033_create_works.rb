class CreateWorks < ActiveRecord::Migration
  def change
	create_table :works do |t|
	  t.string :title
	  t.text :description
	  t.integer :category_id
	  t.belongs_to :category, index: true

	  t.timestamps null: false
	end

  end
end