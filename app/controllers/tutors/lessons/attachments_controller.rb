class Tutors::Lessons::AttachmentsController < Tutors::BaseController
  before_action :set_lesson, only: %i[ index create new ]

  def index
  end

  def new
  end

  def create
    respond_to do |format|
      if @lesson.update!(lesson_params)
        flash[:notice] = t('tutors.lessons.attachments.files_uploadet')
        format.html { redirect_to tutors_lesson_attachments_path(@lesson) }
      else
        flash[:notice] = t('tutors.lessons.attachments.files_not_uploadet')
        render 'new'
      end
    end
  end

  def destroy
    @file = ActiveStorage::Attachment.find(params[:id])
    @file.purge

    redirect_back(fallback_location: tutors_lesson_attachments_path, success: t('tutors.lessons.attachments.file_remove'))
  end

  private

  def set_lesson
    @lesson = current_tutor_profile.lessons.find_by(uuid: params[:lesson_id])
  end

  def lesson_params
    params.require(:lesson).permit(attachments: [])
  end
end