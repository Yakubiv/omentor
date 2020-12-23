class LessonsQuery
  def initialize(params)
    @type = params.fetch(:type)
    @search_string = params.fetch(:search_string)
    @current_tutor_profile = params.fetch(:current_tutor_profile, nil)
    @current_student_profile = params.fetch(:current_student_profile, nil)
  end

  def results
    send("fetch_#{type}_lessons")
  end

  private

  attr_reader :type, :current_tutor_profile, :current_student_profile, :search_string

  def fetch_tutor_lessons
    current_tutor_profile.lessons.joins(:student_profile, :subject)
                         .where('profiles.first_name ilike :search OR
                                 profiles.last_name ilike :search OR
                                 subjects.name ilike :search', search: "%#{search_string}%")
  end

  def fetch_student_lessons
    current_student_profile.lessons.joins(:tutor_profile, :subject)
                           .where('profiles.first_name ilike :search OR
                                   profiles.last_name ilike :search OR
                                   subjects.name ilike :search', search: "%#{search_string}%")
  end
end