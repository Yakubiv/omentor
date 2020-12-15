# frozen_string_literal: true

class Tutors::ChatsController < Tutors::BaseController
  before_action :load_class_rooms, only: %i[show]

  def index
    @class_rooms = ChatQuery.new(query_params).results
  end

  def show
    @class_room = ClassRoom.includes(:messages, :student_profile, :tutor_profile).find_by(uuid: params[:id])
    @messages = @class_room.messages

    @messages.my_unread_messages(current_tutor_profile).update_all(read: true)
  end

  private

  def query_params
    { search_string: params[:search], type: "student", current_tutor_profile: current_tutor_profile }
  end

  def load_class_rooms
    @class_rooms = current_tutor_profile.class_rooms.includes(:student_profile)
  end
end