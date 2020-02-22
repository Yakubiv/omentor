# frozen_string_literal: true

class Students::MyTutorsController < Students::BaseController
  def index
    @tutors = current_student_profile.tutor_profiles
  end
end