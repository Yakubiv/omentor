class Tutor::CalculateAvgRating
  def initialize(tutor_profile)
    @tutor_profile = tutor_profile
  end

  def calculate
    tutor_profile.update(stars: avg_rating)
  end

  private

  attr_reader :tutor_profile

  def avg_rating
    stars = tutor_profile.reviews.pluck(:stars)
    return 0 if stars.size.zero?

    (stars.sum.to_f / stars.size).round(1)
  end
end