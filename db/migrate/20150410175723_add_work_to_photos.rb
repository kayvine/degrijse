class AddWorkToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :work_id, :integer
  end
end
