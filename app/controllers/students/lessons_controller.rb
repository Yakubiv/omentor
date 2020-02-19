# frozen_string_literal: true

class Students::LessonsController < Students::BaseController
  def index
    @lessons = current_student_profile.lessons
  end

  def show
  end
end