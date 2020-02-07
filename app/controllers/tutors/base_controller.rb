# frozen_string_literal: true

module Tutors
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_current_user_is_tutor?
    before_action :set_time_zone, if: :tutor_signed_in?

    layout 'tutors'

    def current_tutor_profile
      current_user.tutor_profile
    end
    helper_method :current_tutor_profile

    def verify_current_user_is_tutor?
      redirect_to students_dashboard_path, notice: 'You can not see this page' unless current_user.tutor?
    end

    def redirect_to_default
      redirect_to root_path
    end

    private

    def tutor_signed_in?
      current_user && current_user&.tutor_profile
    end

    def set_time_zone
      Time.zone = current_tutor_profile.time_zone
    end
  end
end