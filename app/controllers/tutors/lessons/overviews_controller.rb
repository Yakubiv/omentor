class Tutors::Lessons::OverviewsController < Tutors::BaseController
  before_action :set_lesson, only: %i[ index ]

  def index
  end
end