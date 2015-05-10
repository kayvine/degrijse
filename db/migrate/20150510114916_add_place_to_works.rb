class AddPlaceToWorks < ActiveRecord::Migration
  def change
    add_column :works, :place, :string
  end
end
