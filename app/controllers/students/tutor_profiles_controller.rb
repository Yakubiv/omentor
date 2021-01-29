# frozen_string_literal: true

class Students::TutorProfilesController < Students::BaseController
  def index
    @tutors_query ||= TutorProfilesQuery.new(TutorProfile.active, search_params)
    @pagy, @tutors = pagy(@tutors_query.call, items: 15)
  end

  private

  def search_params
    return {} if params[:search_tutor].blank?

    params.require(:search_tutor)
          .permit(:subject, :price_range, days: [], periods: [])
  end
end