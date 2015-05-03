class MessageMailer < ActionMailer::Base
  default from: "Your Mailer <noreply@degrijse.com>"

  def new_message(message)
    @message = message
    
    mail(to: "Your Name <kevin.delme@gmail.com>", subject: "Message from #{message.name}")
  end

end