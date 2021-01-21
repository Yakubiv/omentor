class Students::Lessons::ChatsController < Students::BaseController
  before_action :set_lesson, only: %i[ index ]

  def index
  end

  private

  def set_lesson
    @lesson = current_student_profile.lessons.find_by(uuid: params[:lesson_id])
  end
end