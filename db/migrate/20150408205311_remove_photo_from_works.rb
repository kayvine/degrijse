class RemovePhotoFromWorks < ActiveRecord::Migration
  def change
    remove_column :works, :photo_id, :integer
  end
end
