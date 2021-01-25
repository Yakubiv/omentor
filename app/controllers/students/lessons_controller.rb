# frozen_string_literal: true

class Students::LessonsController < Students::BaseController
  before_action :load_lessons_counter, except: :show

  def index
    @pagy, @lessons = pagy(LessonsQuery.new(lessons_query).results, items: 15)
  end

  %w[paid pending completed canceled].each do |status|
    define_method status.to_sym do
      @pagy, @lessons = pagy(current_student_profile.lessons.send(status), items: 15)
      render 'index'
    end
  end

  private

  def lessons_query
    { search_string: params[:search],
      type: "student",
      current_student_profile: current_student_profile }
  end

  def load_lessons_counter
    @lessons_count ||= current_student_profile.lessons.group(:status).count
  end
end