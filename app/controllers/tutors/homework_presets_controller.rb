module Tutors
  class HomeworkPresetsController < BaseController
    def index
      @homework_presets = current_tutor_profile.homework_presets.active
    end

    def show
      @homework_preset = current_tutor_profile.homework_presets.find(homework_preset_params[:id])
    end

    def new
      @homework_preset = current_tutor_profile.homework_presets.new
    end

    def create
      @homework_preset = current_tutor_profile.homework_presets.new(homework_preset_params)

      if @homework_preset.save!
        redirect_to @homework_preset, notice: 'Homework preset was created'
      else
        render 'new'
      end
    end

    private

    def homework_preset_params
      params.require(:homework_preset).permit(:description, :active,
                                              :subject_theme, :subject_id)
    end
  end
end
