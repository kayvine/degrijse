class MessageMailer < ApplicationMailer
  default from: "Your Mailer <contact@jeroendegrijse.be>"

  def new_message(message)
    @message = message
    
    mail(to: "Voor Jeroen <contact@jeroendegrijse.be>", subject: "Bericht van #{message.name} via je website")
  end

end