class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel",  mod_msg: msg_render(message)
    end
  end

  private

    def message_params
      params.require(:message).permit(:body)
    end

    def msg_render(msg)
      render(partial: 'message', locals: {message: msg})
    end

end