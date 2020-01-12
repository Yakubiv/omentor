# frozen_string_literal: true

class Students::Tutors::BookingsController < Students::BaseController
  def show
    @tutor_profile = TutorProfile.friendly.find(params[:tutor_id])
  end

  def create

  end
end