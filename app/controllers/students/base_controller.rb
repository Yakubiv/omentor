# frozen_string_literal: true

class Students::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_is_student?
  before_action :set_time_zone, if: :student_signed_in?

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

  def student_signed_in?
    current_user && current_user&.student_profile
  end

  def set_time_zone
    Time.zone = current_student_profile.time_zone
  end

  # move to pundit
  def check_if_required_fileds_are_filled?
    if current_user && current_user.student_profile.nil?
      redirect_to students_details_path
    end
  end
end