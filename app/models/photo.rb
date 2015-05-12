class Photo < ActiveRecord::Base

	has_attached_file :image, 
		styles: { :large => "910^", :medium => "400x266#", :thumb => "150x100>" }, 
		processors: [:thumbnail, :paperclip_optimizer],
		storage: :sftp,
		path: "/customers/6/0/e/jeroendegrijse.be/httpd.www/heroku/work/images/:style/:filename",
		url: "//www.jeroendegrijse.be/heroku/work/images/:style/:filename",
		sftp_options: {
			host: "sftp.jeroendegrijse.be",
			user: "jeroendegrijse.be",
			password: "malojas12",
			port: 22
		}

	validates_attachment :image,
		:presence => true,
		:size => { :in => 0..20.megabytes },
		:content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
end
