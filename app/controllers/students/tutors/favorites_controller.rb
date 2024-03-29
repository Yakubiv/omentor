class Students::Tutors::FavoritesController < Students::BaseController
  before_action :set_tutor_profile, only: [:create, :destroy]
  before_action :student_chat_ids, only: :index

  def index
    @pagy, @favorite_tutors = pagy(FavoritesProfilesQuery.new(favorites_params).results, items: 15)
  end

  def create
    current_student_profile.favorites.create(favoritable: @tutor_profile)
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    Favorite.find_by(favoritable_id: @tutor_profile.id, profile_id: current_student_profile.id).destroy
    respond_to do |format|
      format.js {}
    end
  end

  private

  def favorites_params
      { search_string: params[:search],
        type: "tutors",
        current_student_profile: current_student_profile }
    end

  def set_tutor_profile
    @tutor_profile = TutorProfile.friendly.find(params[:tutor_id])
  end

end