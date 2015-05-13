class ApplicationMailer < ActionMailer::Base
  default from: "Website <contact@jeroendegrijse.be>"
  default to: "Jeroen <contact@jeroendegrijse.be>"
  layout 'mailer'
end
