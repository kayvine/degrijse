# degrijse

Eerste app van kevin.

# Useful tools

welcome.coffee error: js in .coffee file ==> http://js2.coffee/ javascript to coffeescript converter

#
# TO DO:
#


Fix AnimatedHeader: doesn't work with turbolinks
------------------------------------------------
make DOM ready:

	(function() {
		var ready;
		ready = function() {

			/* code here */

		};
		$(document).ready(ready);
		$(document).on('page:load', ready);
	}).call(this);


Install paperclip/rmagick for images
------------------------------------

In development mode, you might add this line to config/environments/development.rb):

	Paperclip.options[:command_path] = "/usr/local/bin/"

	<%= simple_form_for @work, html: { :multipart => true } do |f| %>
		<%= f.input :title %>
		<%= f.input :description %>
		<%= f.input :category_id, collection: @categories, as: :select, prompt: "Please select" %>
		<h3 id="photos">Photos</h3>
		<%= f.simple_fields_for :photos do |photo| %>
			<%= render 'photo_fields', :f => photo %>
		<% end %>
		<div class="links">
			<%= link_to_add_association 'add photo', f, :photos %>
		</div>
		<br>
		<div class="actions">
			<%= f.button :submit, :disable_with => 'Please wait ...' %>
		</div>
	<% end %>


Store paperclip images via ftp #DONE#
--------------------------------

	has_attached_file :image, 
		:styles => { :large => "960", :medium => "400x300>", :thumb => "100x100" }, 

		# Choose the FTP storage backend
		:storage => :ftp,

		# Set where to store the file on the FTP server(s).
		# This supports Paperclip::Interpolations.
		:path => "/rubytest/images/:style/:filename",

		# The full URL of where the attachment is publicly accessible.
		# This supports Paperclip::Interpolations.
		:url => "http://www.papomode.be/rubytest/images/:style/:filename",

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


Optimizing and minifying uploaded images
----------------------------------------

Using [PaperclipOptimizer](https://github.com/janfoeh/paperclip-optimizer)


Make Site-name slide up using Stellar.js
----------------------------------------

initialise Stellar.js (keep scrolling from skipping: hideDistantElements: false):
$ ->
	$.stellar({hideDistantElements: false})

	<div id="page-wrapper" data-stellar-background-ratio="0.3">
		<div id="page">
			<div id="name-and-slogan" data-stellar-ratio="1.3">
				<h1 id="site-name">
					<a href="/" title="Home" rel="home"><span>Site Name</span></a>
				</h1>
				<div id="site-slogan">Portfolio</div>
			</div> <!-- /#name-and-slogan -->


Get Works into portfolio section
--------------------------------

Make Welcome_controller ready for works:

	def index
		@works = Work.all
	end

index.html.erb:

	<% @works.each do |work| %>
		<div class="col-md-4 col-sm-6 portfolio-item">
				<a href="#portfolioModal<%= work.id %>" class="portfolio-link" data-toggle="modal">
						<div class="portfolio-hover">
								<div class="portfolio-hover-content">
										<h4><%= work.title %></h4>
										<p class="text-muted"><%= work.category.name %></p>
										<i class="fa fa-plus fa-3x"></i>
								</div>
						</div>
						<%= image_tag work.photos.first.image.url(:medium) %>
				</a>
				<div class="portfolio-caption">
						<h4><%= work.title %></h4>
						<p class="text-muted"><%= work.category.name %></p>
				</div>
		</div>
	<% end %>


Generate Portfolio Modals
--------------------------

<!-- Portfolio Modals -->
<!-- Use the modals below to showcase details about your portfolio projects! -->
	<% @works.each do |work| %>
		<div class="portfolio-modal modal fade" id="portfolioModal<%= work.id %>" tabindex="-1" role="dialog" aria-hidden="true">
				<!-- modal-content -->
		</div>
	<% end %>


Get Blog/News into Blog/News section
------------------------------------

show 5 latest posts in timeline:

	@blogs.order("blog_date desc").limit(5).each do |blog|




# Non-sitebreaking errors

(sublime_text:14614): GLib-CRITICAL **: Source ID 3633 was not found when attempting to remove it