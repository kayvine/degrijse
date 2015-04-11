class Photo < ActiveRecord::Base
	belongs_to :work
	
	has_attached_file :image, 
		:styles => { :medium => "360x360>", :thumb => "100x100>" }, 
		:url => "/assets/images/:category/:style/:filename"

	validates_attachment :image,
		:presence => true,
		:size => { :in => 0..20.megabytes },
		:content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
end
