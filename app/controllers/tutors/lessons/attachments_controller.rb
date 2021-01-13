class Tutors::Lessons::AttachmentsController < Tutors::BaseController
  before_action :set_lesson, only: %i[ index create ]

  def index
  end

  def create
    respond_to do |format|
      if @lesson.update!(lesson_params)
        format.html { redirect_to tutors_lesson_attachments_path(@lesson) }
      end
    end
  end

  private

  def set_lesson
    @lesson = current_tutor_profile.lessons.find_by(uuid: params[:lesson_id])
  end

  def lesson_params
    params.require(:lesson).permit(attachments: [])
  end
end