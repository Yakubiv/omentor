class TutorAvgRatingJob < ApplicationJob
  queue_as :default

  def perform(tutor_profile)
    Tutor::CalculateAvgRating.new(tutor_profile).calculate
  end
end