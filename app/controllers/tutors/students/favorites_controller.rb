class Tutors::Students::FavoritesController < Tutors::BaseController
    before_action :set_student_profile, only: [:create, :destroy]
    before_action :tutor_chat_ids, only: :index

    def index
        @pagy, @favorite_students = pagy(FavoritesProfilesQuery.new(favorites_params).results, items: 15)
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

    def favorites_params
      { search_string: params[:search],
        type: "students",
        current_tutor_profile: current_tutor_profile }
    end

    def set_student_profile
        @student_profile = StudentProfile.friendly.find(params[:student_id])
    end

end