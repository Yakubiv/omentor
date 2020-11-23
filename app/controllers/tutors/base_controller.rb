# frozen_string_literal: true

module Tutors
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_current_user_is_tutor?
    before_action :set_time_zone, if: :tutor_signed_in?
    before_action :varify_that_user_filled_his_details, if: :user_signed_in?
    before_action :inactive_tutors_details

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

    def inactive_tutors_details
      redirect_to inactive_tutors_details_path if current_tutor_profile.inactive?
    end

    private

    def varify_that_user_filled_his_details
      return true if not_ready_redirect_path.nil?

      redirect_to not_ready_redirect_path
    end

    def not_ready_redirect_path
      return tutors_details_path unless current_user.tutor_profile

      if !current_user.tutor_profile.avatar.attached?
        photo_tutors_details_path
      elsif current_user.tutor_profile.video_url.nil?
        video_tutors_details_path
      end
    end

    def tutor_signed_in?
      current_user && current_user&.tutor_profile
    end

    def set_time_zone
      Time.zone = current_tutor_profile.time_zone
    end
  end
end