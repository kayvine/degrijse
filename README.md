# degrijse

Eerste app van kevin.


To do:

- Add cdn: http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js to application.js:

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

- Fix AnimatedHeader: doesn't work with turbolinks

(function() {
  var ready;

  ready = function() {

  	/* code here */

  };

  $(document).ready(ready);

  $(document).on('page:load', ready);

}).call(this);

- heroku push failed
DEPRECATION WARNING: The configuration option `config.serve_static_assets` has been renamed to `config.serve_static_files` to clarify its role (it merely enables serving everything in the `public` folder and is unrelated to the asset pipeline). The `serve_static_assets` alias will be removed in Rails 5.0. Please migrate your configuration files accordingly. (called from block in tsort_each at /app/vendor/ruby-2.2.0/lib/ruby/2.2.0/tsort.rb:226)
