# frozen_string_literal: true

class Students::ChatsController < Students::BaseController
  before_action :load_class_rooms, only: %i[index show]

  def index
  end

  def show
    @class_room = ClassRoom.find_by(uuid: params[:id])
    @messages = @class_room.messages
  end

  private

  def load_class_rooms
    @class_rooms = current_student_profile.class_rooms.includes(:tutor_profile)
  end
end
