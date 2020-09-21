class Students::Tutors::FavoritesController < Students::BaseController
  before_action :set_tutor_profile

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

  def set_tutor_profile
    @tutor_profile = TutorProfile.friendly.find(params[:tutor_id])
  end

end