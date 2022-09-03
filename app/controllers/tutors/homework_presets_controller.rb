module Tutors
  class HomeworkPresetsController < BaseController
    before_action :subject, only: %i[show new create update edit]

    def index
      @homework_presets = current_tutor_profile.homework_presets.active
    end

    def show
      @homework_preset = current_tutor_profile.homework_presets.find(params[:id])
    end

    def new
      @homework_preset = current_tutor_profile.homework_presets.new
    end

    def create
      @homework_preset = current_tutor_profile.homework_presets.new(homework_preset_params)

      if @homework_preset.save
        redirect_to tutors_subject_homework_preset_path(@subject, @homework_preset), notice: 'Homework preset was created'
      else
        render 'new'
      end
    end

    def edit
      @homework_preset = current_tutor_profile.homework_presets.find(params[:id])
    end

    def update
      @homework_preset = current_tutor_profile.homework_presets.find(params[:id])

      if @homework_preset.update(homework_preset_params)
        redirect_to tutors_subject_homework_preset_path(@subject, @homework_preset), notice: 'Homework preset was updated'
      else
        render 'edit'
      end
    end

    def destroy
      @@homework_preset = current_tutor_profile.homework_presets.find(params[:id])
      @@homework_preset.destroy

      redirect_to tutors_subject_homework_presets_path, notice: 'Homework preset was deleted'
    end

    private

    def homework_preset_params
      params.require(:homework_preset).permit(:description, :active,
                                              :subject_theme, :subject_id)
    end

    def subject
      @subject ||= current_tutor_profile.subjects.find(params[:subject_id])
    end
  end
end
