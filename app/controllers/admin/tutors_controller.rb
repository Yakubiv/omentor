class Admin::TutorsController < Admin::BaseController
  # GET /subjects
  # GET /subjects.json
  def index
    @pagy, @tutors = pagy(TutorProfile.all, items: 15)
  end

  def edit
    @tutor = TutorProfile.friendly.find(params[:id])
  end

  def update
    @tutor = TutorProfile.friendly.find(params[:id])
    @tutor.update(tutor_params)
    redirect_to admin_tutors_path, notice: t('admins.tutors.updated', tutor: @tutor.name)
  end

  private

  def tutor_params
    params.require(:tutor_profile)
          .permit!
  end
end