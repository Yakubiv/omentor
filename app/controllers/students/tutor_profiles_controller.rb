# frozen_string_literal: true

class Students::TutorProfilesController < Students::BaseController
  def index
    @tutors = TutorProfile.active
  end
end