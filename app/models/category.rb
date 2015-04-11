class Category < ActiveRecord::Base
	has_many :works

	accepts_nested_attributes_for :works

	validates :name, :presence => true
end
