# frozen_string_literal: true

class Tutors::CalendarsController < Tutors::BaseController
  before_action :set_vacation, only: [:edit, :update]

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
    @vacation = current_tutor_profile.vacations.create(vacation_params)
    if @vacation.save
      redirect_to tutors_calendars_path, notice: "Vacation was created"
    else
      render 'new'
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @vacation.update(vacation_params)
      redirect_to tutors_calendars_path, notice: "Vacation was updated"
    else
      render 'edit'
    end
  end

  private 
    def set_vacation 
      @vacation = Vacation.find(params[:id])
    end

    def vacation_params
      params.require(:vacation).permit(:description, :start_at, :end_at, :status)
    end

end
