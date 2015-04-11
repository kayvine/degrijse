class RemoveAttachmentFromWorks < ActiveRecord::Migration
  def change
  	remove_attachment :works, :photo
  end
end