class StudentsQuery 

  def initialize(params)
    @search_string = params[:search_string]
    @type = params[:type]
    @current_tutor_profile = params[:current_tutor_profile]
    @current_student_profile = params[:current_student_profile]
  end

  def results
    send("fetch_#{type}")
  end

  private

  attr_reader :search_string, :type, :current_tutor_profile, :current_student_profile

  def fetch_students
    current_tutor_profile.student_profiles
                         .where('profiles.first_name ilike :search OR
                                 profiles.last_name ilike :search OR
                                 profiles.country_name ilike :search OR
                                 profiles.city ilike :search', search: "%#{search_string}%")
  end

  def fetch_tutors
  end

end