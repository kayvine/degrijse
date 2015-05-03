class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
  
      if @message.valid?
        # Tell the messageMailer to send a new message if valid
        MessageMailer.new_message(@message).deliver_now

        redirect_to root_path, notice: 'message was successfully created.'
        # redirect_to contact_path, notice: "Your messages has been sent."
      else
        # redirect_to @message, alert: "An error occurred while delivering this message."
        flash.now[:alert] = "An error occurred while delivering this message."
        render "new"
      end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :content)
    end

end