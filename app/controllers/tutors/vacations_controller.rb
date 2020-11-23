class Tutors::VacationsController < Tutors::BaseController
  before_action :set_vacation, only: [:edit, :destroy, :update]

  def index 
    @pagy, @vacations = pagy(Vacation.all)
  end

  def new
    @vacation = current_tutor_profile.vacations.new
  end

  def create 
    @vacation = current_tutor_profile.vacations.create(vacation_params)
    if @vacation.save
      flash[:notice] = "Vacation was created"  
      redirect_to new_tutors_vacation_path
    else 
      render 'new'
    end
  end

  def edit 
  end

  def update 
    if @vacation.update(vacation_params)
      flash[:notice] = "Vacation was updated"
      redirect_to tutors_vacations_path(@Vacation)
    else
      flash[:notice] = "Vacation was not updated"
      render 'edit'
    end    
  end

  def destroy
    @vacation.destroy
    flash[:notice] = "Vacation was deleted"
    redirect_to tutors_vacations_path
  end

  private

  def set_vacation
    @vacation = Vacation.find(params[:id])
  end

  def vacation_params
    params.require(:vacation).permit(:description, :start_at, :end_at, :status)
  end
end