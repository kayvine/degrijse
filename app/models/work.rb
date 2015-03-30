class Work < ActiveRecord::Base
 
	belongs_to  :category

	validates :title, :description, :category_id, :presence => true
end
