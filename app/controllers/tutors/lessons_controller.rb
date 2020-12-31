# frozen_string_literal: true

class Tutors::LessonsController < Tutors::BaseController
  before_action :load_lessons_counter, except: :show

  def index
    @lessons = LessonsQuery.new(lessons_query).results
  end

  def show
    @lesson = current_tutor_profile.lessons.find_by(uuid: params[:id])
    @class_room = @lesson.class_room
    @messages = @class_room.messages
    @message = Message.new
  end

  %w[paid pending completed canceled].each do |status|
    define_method status.to_sym do
      @lessons = current_tutor_profile.lessons.send(status)
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