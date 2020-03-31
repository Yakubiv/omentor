class ClassRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat:#{current_profile.id}-#{params[:class_room_id]}" if params[:class_room_id]
  end

  def unsubscribed
    stop_all_streams
  end
end
