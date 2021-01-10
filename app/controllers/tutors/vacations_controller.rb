class Tutors::VacationsController < Tutors::BaseController
  before_action :set_vacation, only: [:edit, :destroy, :update]

  def index 
    @pagy, @vacations = pagy(Vacation.order(created_at: :desc))
  end

  def new
    @vacation = current_tutor_profile.vacations.new
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
  end

  def update 
    if @vacation.update(vacation_params)
      redirect_to tutors_vacations_path, notice: "Vacation was updated"
    else
      render 'edit'
    end    
  end

  def destroy
    @vacation.destroy
    redirect_to tutors_vacations_path, notice: "Vacation was deleted"
  end

  private

  def set_vacation
    @vacation = Vacation.find(params[:id])
  end

  def vacation_params
    params.require(:vacation).permit(:description, :start_at, :end_at, :status)
  end
end