# degrijse

Eerste app van kevin.

###############
### To do: ###
#############

- Add cdn: http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js to application.js:
-----------------------------------------------------------------------------------------------------------

// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require "http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" <= werkt niet !!!
//= require classie
//= require cbpAnimatedHeader
//= require agency

Voorlopig: <%= javascript_include_tag "http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" %> in application.html.erb

- Fix AnimatedHeader: doesn't work with turbolinks #FIXED#
-----------------------------------------------------------
#make DOM ready
(function() {
  var ready;

  ready = function() {

  	/* code here */

  };

  $(document).ready(ready);

  $(document).on('page:load', ready);

}).call(this);


- heroku push failed #FIXED#
----------------------------
DEPRECATION WARNING: The configuration option `config.serve_static_assets` has been renamed to `config.serve_static_files` to clarify its role (it merely enables serving everything in the `public` folder and is unrelated to the asset pipeline). The `serve_static_assets` alias will be removed in Rails 5.0. Please migrate your configuration files accordingly. (called from block in tsort_each at /app/vendor/ruby-2.2.0/lib/ruby/2.2.0/tsort.rb:226)

welcome.coffee error: js in .coffee file ==> http://js2.coffee/ javascript to coffeescript converter


- Install paperclip/rmagick for images 
---------------------------------------
In development mode, you might add this line to config/environments/development.rb):
	Paperclip.options[:command_path] = "/usr/local/bin/"

has_attached_file :photo,	:url => "/assets/images/portfolio/:category/:style/:filename"
							:path => ":rails_root/public/assets/images/portfolio/:category/:style/:filename"


  <% f.fields_for :product_images do |builder| %>
    <% if builder.object.new_record? %>
    <div class="field">
      <%= builder.label :caption, "Image Caption" %>
      <%= builder.text_field :caption %>
    </div>																		| THIS DOES NOT WORK
    <div class="field">															| I dont understand why not :(
      <%= builder.label :photo, "Image File" %>
      <%= builder.file_field :photo %>
    </div>
    <div class="field">
      <%= builder.check_box :_destroy %>
    </div>
    <% end %>
  <% end %>

  <% @product.product_images.each do |product_image| %>
    <%= f.fields_for product_image, index: product_image.id do |product_image_form|%>
      <% if product_image_form.object.new_record? %>
      <div class="field">
        <%= product_image_form.label :caption, "Image Caption" %>
        <%= product_image_form.text_field :caption %>
      </div>																	| THIS WORKS !!!!!!!!!!
      <div class="field">
        <%= product_image_form.label :photo, "Image File" %>
        <%= product_image_form.file_field :photo %>
        <%= product_image_form.check_box :_destroy %>
      </div>
      <% end %>
    <% end %>
  <% end %>



- Get Works into portfolio section
-----------------------------------

<%= image_tag("portfolio/roundicons.png", class: "img-responsive") %>
--> image tag searches in assets/images folder


- Generate Portfolio Modals
----------------------------

<!-- Portfolio Modals -->
<!-- Use the modals below to showcase details about your portfolio projects! -->


- Get Blog/News into Blog/News section
---------------------------------------

show 5 latest posts in timeline


(sublime_text:14614): GLib-CRITICAL **: Source ID 3633 was not found when attempting to remove it
