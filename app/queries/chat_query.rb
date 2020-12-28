class ChatQuery

  def initialize(params)
    @search_string = params[:search_string]
    @type = params[:type]
    @current_tutor_profile = params[:current_tutor_profile]
    @current_student_profile = params[:current_student_profile]
  end

  def results
    send("fetch_#{type}_profiles")
  end

  private

  attr_reader :type, :current_tutor_profile, :current_student_profile, :search_string

  def fetch_student_profiles
    current_tutor_profile.class_rooms.joins(:student_profile)
      .where("profiles.first_name ilike :search OR profiles.last_name ilike :search", search: "%#{search_string}%")
  end

  def fetch_tutor_profiles
    current_student_profile.class_rooms.joins(:tutor_profile)
      .where("profiles.first_name ilike :search OR profiles.last_name ilike :search", search: "%#{search_string}%")
  end

end