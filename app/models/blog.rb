class Blog < ActiveRecord::Base

	validates :blog_title, :blog_text, :blog_date, :presence => true

	has_attached_file :blog_image, 
		:styles => { :medium => "400x400>", :thumb => "100x100>" }, 
		processors: [:thumbnail, :paperclip_optimizer],
		storage: :sftp,
		path: "/customers/6/0/e/jeroendegrijse.be/httpd.www/heroku/blog/images/:style/:filename",
		url: "//www.jeroendegrijse.be/heroku/blog/images/:style/:filename",
		sftp_options: {
			host: "sftp.jeroendegrijse.be",
			user: "jeroendegrijse.be",
			password: "malojas12",
			port: 22
		}

	validates_attachment :blog_image,
		:presence => true,
		:size => { :in => 0..20.megabytes },
		:content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
end
