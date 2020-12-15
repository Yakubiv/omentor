class ChatQuery

  def initialize(params)
    @search_string = params[:search_string]
    @type = params[:type]
    @current_tutor_profile = params[:current_tutor_profile]
  end

  def results
    send("fetch_#{type}_profiles")
  end

  private

  attr_reader :type, :current_tutor_profile, :search_string

  def fetch_student_profiles
    current_tutor_profile.student_profiles
                      # .where("profiles.first_name ilike :search OR profiles.last_name ilike :search", search: "%#{search_string}%")
  end

end       