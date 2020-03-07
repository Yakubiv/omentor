# frozen_string_literal: true

class Students::Lessons::VideosController < Students::BaseController
  layout 'application', only: :show

  def show
  end

  def create
    session = opentok.create_session :media_mode => :routed
    session_id = session.session_id
  end

  private

  def tokbox_client
    @tokbox_client ||= OpenTok::OpenTok.new ENV['TOKBOX_API_KEY'], ENV['TOKBOX_API_SECRET']
  end
end