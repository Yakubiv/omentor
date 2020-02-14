# frozen_string_literal: true

class Students::Lessons::CheckoutsController < Students::BaseController
  def show
    @lesson = Lesson.find_by(uuid: params[:lesson_id])
  end

  def create
  end
end