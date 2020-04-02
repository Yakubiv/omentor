class MessagesController < ApplicationController
  def create
    @class_room = ClassRoom.find_by(uuid: params[:class_room_id])
    message = @class_room.messages.create(message_params)
    recipient = @class_room.opposet_profile_to(message.sender)

    ActionCable.server.broadcast("chat:#{message.profile_id}-#{@class_room.uuid}",
                                 is_owner: true,
                                 html: render_message(message, message.sender, false))
    ActionCable.server.broadcast("chat:#{recipient.id}-#{@class_room.uuid}",
                                 is_owner: false,
                                 html: render_message(message, recipient, true))
  end

  private

  def render_message(message, profile, is_read)
    ApplicationController.renderer.render(partial: 'messages/message',
                                          locals: { message: message,
                                                    is_read: is_read,
                                                    profile: profile })
  end

  def message_params
    params.require(:message)
          .permit(:body, :profile_id)
  end
end