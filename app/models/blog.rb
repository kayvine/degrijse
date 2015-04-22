class Blog < ActiveRecord::Base

	validates :blog_title, :blog_text, :blog_date, :presence => true

	has_attached_file :blog_image, 
		:styles => { :medium => "400x400>", :thumb => "100x100>" }, 

		# Choose the FTP storage backend
		:storage => :ftp,

		# Set where to store the file on the FTP server(s).
		# This supports Paperclip::Interpolations.
		:path => "/rubytest/images/blog/:style/:filename",

		# The full URL of where the attachment is publicly accessible.
		# This supports Paperclip::Interpolations.
		:url => "http://www.papomode.be/rubytest/images/blog/:style/:filename",

		# The list of FTP servers to use
		:ftp_servers => [
		  {
			:host     => "ftp.papomode.be",
			:user     => "papomode.be",
			:password => "fvhb11",
			:port     => 21, # optional, 21 by default
			:passive  => true  # optional, false by default
		  }
		]


	validates_attachment :blog_image,
		:presence => true,
		:size => { :in => 0..20.megabytes },
		:content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
end