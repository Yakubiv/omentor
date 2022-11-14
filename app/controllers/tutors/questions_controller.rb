module Tutors
  class QuestionsController < BaseController
    def new
      @question = homework_preset.questions.new
    end

    def create
      @question = homework_preset.questions.new(question_params)

      if @question.save
        redirect_to tutors_subject_homework_preset_path(subject, homework_preset), notice: 'Question created'
      else
        render 'new'
      end
    end

    private

    def subject
      current_tutor_profile.subjects.find(params[:subject_id])
    end

    def homework_preset
      @homework_preset = current_tutor_profile.homework_presets.find(params[:homework_preset_id])
    end

    def question_params
      params.require(:question).permit(
        :title, :active, :tutor_profile_id, question_options_attributes: [:title, :is_correct]
      )
    end
  end
end
