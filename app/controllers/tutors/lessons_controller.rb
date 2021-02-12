# frozen_string_literal: true

class Tutors::LessonsController < Tutors::BaseController
  before_action :load_lessons_counter, except: :show

  def index
    @pagy, @lessons = pagy(LessonsQuery.new(lessons_query).results, items: 15)
  end

  %w[paid pending completed canceled].each do |status|
    define_method status.to_sym do
      @pagy, @lessons = pagy(current_tutor_profile.lessons.send(status), items: 15)
      render 'index'
    end
  end

  private

  def lessons_query
    { search_string: params[:search],
      type: 'tutor',
      current_tutor_profile: current_tutor_profile }
  end

  def load_lessons_counter
    @lessons_count ||= current_tutor_profile.lessons.group(:status).count
  end
end