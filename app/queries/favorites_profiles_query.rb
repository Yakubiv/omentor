class FavoritesProfilesQuery

  def initialize(params)
    @search_string = params[:search_string]
    @type = params[:type]
    @current_tutor_profile = params[:current_tutor_profile]
    @current_student_profile = params[:current_student_profile] 
  end

  def results
    send("fetch_#{type}_favorites")
  end

  private

  attr_reader :search_string, :type, :current_student_profile, :current_tutor_profile

  def fetch_students_favorites
    current_tutor_profile.favorite_student_profiles
                          .where('profiles.first_name ilike :search OR
                                  profiles.last_name ilike :search OR
                                  profiles.country_name ilike :search OR
                                  profiles.city ilike :search', search: "%#{search_string}%")
  end

  def fetch_tutors_favorites
  end

end