class Work < ActiveRecord::Base
	belongs_to :category
	
	has_many :photos, :dependent => :destroy
	accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes['title'].blank? }, :allow_destroy => true

	validates :title, :description, :category_id, :presence => true
end