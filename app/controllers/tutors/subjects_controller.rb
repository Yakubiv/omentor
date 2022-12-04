module Tutors
  class SubjectsController < BaseController
    def index
      @subjects = current_tutor_profile.subjects
    end

    def show
      @subject = current_tutor_profile.subjects.find(params[:id])
      @homeworks = current_tutor_profile.homework_presets.order(created_at: :desc).where(subject: @subject)
    end
  end
end
