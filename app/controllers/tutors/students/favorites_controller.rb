class Tutors::Students::FavoritesController < Tutors::BaseController
    before_action :set_student_profile, only: [:create, :destroy]

    def index 
        @favorite_students = current_tutor_profile.favorite_student_profiles
    end

    def create
        current_tutor_profile.favorites.create(favoritable: @student_profile)
        respond_to do |format|
            format.js {}
        end
    end

    def destroy
        Favorite.find_by(favoritable_id: @student_profile.id, profile_id: current_tutor_profile.id).destroy
        respond_to do |format|
            format.js {}
        end
    end

    private    

    def set_student_profile
        @student_profile = StudentProfile.friendly.find(params[:student_id])
    end 

end