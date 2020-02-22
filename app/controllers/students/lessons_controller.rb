# frozen_string_literal: true

class Students::LessonsController < Students::BaseController
  before_action :load_lessons_counter, except: :show

  def index
    @lessons = current_student_profile.lessons
  end

  def show
  end

  %w[paid pending completed canceled].each do |status|
    define_method status.to_sym do
      @lessons = current_student_profile.lessons.send(status)
      render 'index'
    end
  end

  private

  def load_lessons_counter
    @lessons_count ||= current_student_profile.lessons.group(:status).count
  end
end