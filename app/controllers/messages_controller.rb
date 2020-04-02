class MessagesController < ApplicationController
  def create
    @class_room = ClassRoom.find_by(uuid: params[:class_room_id])
    message = @class_room.messages.create(message_params)
    recipient = @class_room.opposet_profile_to(message.sender)
    fake_read_message = message.clone
    fake_read_message.read = true

    ActionCable.server.broadcast("chat:#{message.profile_id}-#{@class_room.uuid}",
                                 is_owner: true,
                                 html: render_message(message, message.sender))
    ActionCable.server.broadcast("chat:#{recipient.id}-#{@class_room.uuid}",
                                 is_owner: false,
                                 html: render_message(fake_read_message, recipient))
  end

  private

  def render_message(message, profile)
    ApplicationController.renderer.render(partial: 'messages/message',
                                          locals: { message: message,
                                                    profile: profile })
  end

  def message_params
    params.require(:message)
          .permit(:body, :profile_id)
  end
end