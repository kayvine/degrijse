class AddCategoryToWorks < ActiveRecord::Migration
  def change
    add_column :works, :category_id, :int
  end
end
