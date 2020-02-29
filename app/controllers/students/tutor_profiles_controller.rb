# frozen_string_literal: true

class Students::TutorProfilesController < Students::BaseController
  def index
    @tutors_query ||= TutorProfilesQuery.new(TutorProfile.active, search_params)
    @tutors = @tutors_query.call
  end

  private

  def search_params
    return {} if params[:search_tutor].blank?

    params.require(:search_tutor)
          .permit(:subject, :price_range, days: [], periods: [])
  end
end