class PrivateMessageController < ApplicationController

  layout "user"


  def new_message
    @message = current_user.sent_messages.new
  end

  def show
    @message = PrivateMessage.find( params[:id] )
    @message.readed = true
    @message.save
  end

  def send_private_message
    @message = current_user.sent_messages.new

    begin
      receiver = User.find_by_email( private_message_params[:receiver] )
    rescue ActiveRecord::RecordNotFound => e
      render action: 'new_message'
      return
    end

    #TODO Validatierung Titel muss vorhanden sen und kleiner als 255 Zeichen, Text muss vorhanden sein

    @message.title    = private_message_params[:title]
    @message.content  = private_message_params[:content]
    @message.receiver = receiver
    @message.readed   = false   #TODO als Default setzten

    if @message.save
      redirect_to current_user_messages_path
    else
      render action: 'new_message'
    end

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def private_message_params
      params.require(:private_message).permit(:title, :content, :receiver)
    end

end
