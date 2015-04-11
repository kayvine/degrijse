class AddPhotoToWorks < ActiveRecord::Migration
  def change
    add_column :works, :photo_id, :integer
  end
end
