class Work < ActiveRecord::Base
	belongs_to :category 
	has_many :photos 
	
	accepts_nested_attributes_for :photos, allow_destroy: true

	validates :title, :description, :category_id, :presence => true
end