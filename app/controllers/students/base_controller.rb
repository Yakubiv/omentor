# frozen_string_literal: true

class Students::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_is_student?
  before_action :set_time_zone, if: :student_signed_in?
  before_action :varify_that_user_filled_his_details, if: :user_signed_in?

  layout 'students'

  def current_student_profile
    current_user.student_profile
  end
  helper_method :current_student_profile

  def current_user_is_student?
    redirect_to tutors_dashboard_path unless current_user.student?
  end

  def redirect_to_default
    redirect_to root_path
  end

  private

  def varify_that_user_filled_his_details
    return true if not_ready_redirect_path.nil?

    redirect_to not_ready_redirect_path
  end

  def not_ready_redirect_path
    return students_details_path unless current_user.student_profile

    if !current_user.student_profile.avatar.attached?
      photo_students_details_path
    end
  end

  def student_signed_in?
    current_user && current_user&.student_profile
  end

  def set_time_zone
    Time.zone = current_student_profile.time_zone
  end

  def student_chat_ids
    @student_chat_ids ||= current_student_profile.class_rooms.pluck(:tutor_profile_id, :uuid).to_h
  end

  # move to pundit
  def check_if_required_fileds_are_filled?
    if current_user && current_user.student_profile.nil?
      redirect_to students_details_path
    end
  end
end