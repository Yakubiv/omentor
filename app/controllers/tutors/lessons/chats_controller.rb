class Tutors::Lessons::ChatsController < Tutors::BaseController
  before_action :set_lesson, only: %i[ index ]

  def index
  end

  private

  def set_lesson
    @lesson = current_tutor_profile.lessons.find_by(uuid: params[:lesson_id])
  end
end