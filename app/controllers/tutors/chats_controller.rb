# frozen_string_literal: true

class Tutors::ChatsController < Tutors::BaseController
  before_action :load_class_rooms, only: %i[index show]

  def index
  end

  def show
    @class_room = ClassRoom.find_by(uuid: params[:id])
    @messages = @class_room.messages
  end

  private

  def load_class_rooms
    @class_rooms = current_tutor_profile.class_rooms.includes(:student_profile)
  end
end