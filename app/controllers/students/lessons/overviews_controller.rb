class Students::Lessons::OverviewsController < Students::BaseController
  before_action :set_lesson, only: %i[ index ]

  def index
  end
end