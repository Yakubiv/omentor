class TutorProfileDecorator
  attr_reader :tutor_profile

  def initialize(tutor_profile)
    @tutor_profile = tutor_profile
  end

  def find_age
    ((Time.new() - tutor_profile.birthday) / 1.year.seconds).floor
  end
end