# frozen_string_literal: true

class Tutors::Calendars::LessonsController < Tutors::BaseController
  def create
    lesson_form = Tutors::NewLessonForm.new(lesson_params)
    if lesson_form.submit
      # redirect_back(fallback_location: tutors_calendars_path)
      redirect_to tutors_calendars_path
    else
      head :ok
    end
  end

  def update
  end

  private

  def lesson_params
    params.require(:lesson)
          .permit!
          .merge(tutor_profile: current_tutor_profile)
  end
end
