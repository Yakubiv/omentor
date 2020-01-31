# frozen_string_literal: true

module Tutors
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_current_user_is_tutor?
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
  end
end