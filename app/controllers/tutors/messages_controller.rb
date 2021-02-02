class Tutors::MessagesController < Tutors::BaseController
  before_action :set_class_room, only: %i[new]

  def new
  end

  private

  def set_class_room
    @class_room = ClassRoom.includes(:messages, :student_profile, :tutor_profile).find_by(uuid: params[:class_room_id])
  end
end