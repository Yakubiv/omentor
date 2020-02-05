# frozen_string_literal: true

class Students::Tutors::BookingsController < Students::BaseController
  def show
    # add form object later
    @tutor_profile = TutorProfile.friendly.find(params[:tutor_id])
    @lesson = Lesson.new(price: calculate_price_for_hour_lesson(@tutor_profile))
  end

  def create

  end

  private

  def calculate_price_for_hour_lesson(tutor_profile)
    (tutor_profile.rate * Lesson::ONE_HOUR_DURATION) / 60.0
  end
end