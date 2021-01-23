# frozen_string_literal: true

class Students::TutorProfilesController < Students::BaseController
  def index
    @tutors_query ||= TutorProfilesQuery.new(TutorProfile.active, search_params)
    @tutors = @tutors_query.call
  end

  def show
    @tutor_profile = TutorProfile.friendly.find(params[:id])
    redirect_to students_my_tutor_path(@tutor_profile) if current_student_profile.tutor_profiles.include?(@tutor_profile)
  end

  private

  def search_params
    return {} if params[:search_tutor].blank?

    params.require(:search_tutor)
          .permit(:subject, :price_range, days: [], periods: [])
  end
end