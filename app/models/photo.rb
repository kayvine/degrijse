class Photo < ActiveRecord::Base

	has_attached_file :image, 
		styles: { :large => "910^", :medium => "400x266#", :thumb => "150x100>" }, 
		processors: [:thumbnail, :paperclip_optimizer],

		# Choose the FTP storage backend
		:storage => :ftp,

		# Set where to store the file on the FTP server(s).
		# This supports Paperclip::Interpolations.
		:path => "/heroku/work/images/:style/:filename",

		# The full URL of where the attachment is publicly accessible.
		# This supports Paperclip::Interpolations.
		# For secure site use https://
		:url => "http://www.jeroendegrijse.be/heroku/work/images/:style/:filename",

		# The list of FTP servers to use
		:ftp_servers => [
		  {
			:host     => "sftp.jeroendegrijse.be",
			:user     => "jeroendegrijse.be",
			:password => "malojas12",
			:port     => 22, # optional, 21 by default
			:passive  => true  # optional, false by default
		  }
		]


	validates_attachment :image,
		:presence => true,
		:size => { :in => 0..20.megabytes },
		:content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
end
