class Tutors::Lessons::ChatsController < Tutors::BaseController
  before_action :set_lesson, only: %i[ index ]

  def index
  end
end