# frozen_string_literal: true

class Students::ChatsController < Students::BaseController
  before_action :load_class_rooms, only: %i[index show]

  def index
  end

  def show
    @class_room = ClassRoom.includes(:messages, :student_profile, :tutor_profile).find_by(uuid: params[:id])
    @messages = @class_room.messages

    @messages.my_unread_messages(current_student_profile).update_all(read: true)
  end

  private

  def load_class_rooms
    @class_rooms = current_student_profile.class_rooms.includes(:tutor_profile)
  end
end
