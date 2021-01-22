# frozen_string_literal: true

class Students::Lessons::CheckoutsController < Students::BaseController
  layout 'checkout'

  def show
    @lesson = load_lesson
  end

  def create
    lesson = load_lesson
    lesson.update(status: 'paid')
    redirect_to students_lesson_overviews_path(lesson)
  end

  private

  def load_lesson
    Lesson.find_by(uuid: params[:lesson_id])
  end
end