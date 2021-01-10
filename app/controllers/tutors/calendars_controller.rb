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
    @vacation = current_tutor_profile.vacations.create(vacation_params)
    if @vacation.save
      redirect_to tutors_calendars_path, notice: "Vacation was created"
    else
      render 'new'
    end
  end

  def edit
    @entity = (params[:type] == 'vacation' ? Vacation : Lesson).find(params[:id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if params[:vacation]
      @vacation = Vacation.find(params[:id])
      @vacation.update(vacation_params)
      redirect_to tutors_calendars_path, notice: "Vacation was updated"
    else
      @lesson = Lesson.find(params[:id])
      @lesson.update(lesson_params)
      redirect_to tutors_calendars_path, notice: "Lesson was updated"
    end
  end

  private
    def vacation_params
      params.require(:vacation).permit(:description, :start_at, :end_at, :status)
    end

    def lesson_params
      params.require(:lesson).permit(:description)
    end

end
