class ApplicationMailer < ActionMailer::Base
  default from: "Your Mailer <noreply@degrijse.com>"
  default to: "Your Name <kevin.delme@gmail.com>"
  layout 'mailer'
end
