class Students::Tutors::FavoritesController < Students::BaseController
  before_action :set_tutor_profile
  
  def create
    current_student_profile.favorites.create(favoritable: @tutor_profile)
    render json: { message: "removed" }, status: :ok
  end

  def destroy
    Favorite.find_by(favoritable_id: @tutor_profile.id, profile_id: current_student_profile.id).destroy
    render json: { message: "removed" }, status: :ok
  end

  private 
  
  def set_tutor_profile
    @tutor_profile = TutorProfile.friendly.find(params[:tutor_id])
  end

end