# frozen_string_literal: true

class Tutors::CalendarsController < Tutors::BaseController
  def index
    @time_slots = TutorProfileCalendarEventsQuery.new(current_tutor_profile).results
    respond_to do |format|
      format.html
      format.json { render json: @time_slots }
    end
  end

  def new 
    @vacation = current_tutor_profile.vacations.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create 
    current_tutor_profile.vacations.create(vacation_params)
  end

  private 

    def vacation_params
      params.require(:vacation).permit(:description, :start_at, :end_at, :status)
    end

end