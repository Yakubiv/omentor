class Admin::StudentsController < Admin::BaseController
  # GET /subjects
  # GET /subjects.json
  def index
    @students = StudentProfile.all
  end

  def edit
    @student = StudentProfile.friendly.find(params[:id])
  end

  def update
    @student = StudentProfile.friendly.find(params[:id])
    @student.update(student_params)
    redirect_to admin_students_path, notice: t('admins.students.updated', student: @student.name)
  end

  private

  def student_params
    params.require(:student_profile)
          .permit!
  end
end