class TutorAvgRatingJob < ApplicationJob
  queue_as :default

  def perform(tutor_profile)
    CalculateAvgRating.new(tutor_profile).calculate
  end
end