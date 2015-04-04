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

