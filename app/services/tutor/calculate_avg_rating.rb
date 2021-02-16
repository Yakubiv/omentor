class CalculateAvgRating
  def initialize(tutor_profile)
    @tutor_profile = tutor_profile
  end

  def calculate
    tutor_profile.update(stars: avg_rating)
  end

  attr_reader :tutor_profile

  private

  def avg_rating
    stars = tutor_profile.reviews.pluck(:stars)
    stars.sum / stars.size
  end
end