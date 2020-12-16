class ChatQuery

  def initialize(params)
    @search_string = params[:search_string]
    @type = params[:type]
    @current_profile = params[:current_profile]
  end

  def results
    send("fetch_#{type}_profiles")
  end

  private

  attr_reader :type, :current_profile, :search_string

  def fetch_student_profiles
    current_profile.class_rooms.joins(:student_profile)
      .where("profiles.first_name ilike :search OR profiles.last_name ilike :search", search: "%#{search_string}%")
  end

  def fetch_tutor_profiles
    current_profile.class_rooms.joins(:tutor_profile)
      .where("profiles.first_name ilike :search OR profiles.last_name ilike :search", search: "%#{search_string}%")
  end

end