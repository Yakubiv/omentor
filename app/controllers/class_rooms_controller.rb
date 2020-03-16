# frozen_string_literal: true

class ClassRoomsController < ApplicationController
  layout 'video', only: :show

  def show
    @lesson = Lesson.find_by(uuid: params[:lesson_id])
    @class_room = @lesson.class_room
    if !@class_room.tokbox_session_id
      session = tokbox_client.create_session :media_mode => :routed
      session_id = session.session_id
      @class_room.update(tokbox_session_id: session_id)
    end
    if @class_room.updated_at > 24.hours.ago
      tokbox_token = tokbox_client.generate_token(@class_room.tokbox_session_id)
      @class_room.update(tokbox_token: tokbox_token, active_call: true)
    end
  end

  private

  def tokbox_client
    @tokbox_client ||= OpenTok::OpenTok.new ENV['TOKBOX_API_KEY'], ENV['TOKBOX_API_SECRET']
  end
end